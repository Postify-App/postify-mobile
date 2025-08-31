import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:postify/core/error/failures.dart';

class SocialAuthHandler {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  SocialAuthHandler(this.googleSignIn, this.firebaseAuth);

  Future<Either<Failure, String?>> signInWithGoogle() async {
    try {
      await googleSignIn.initialize(); // required in v7
      final googleUser = await googleSignIn
          .authenticate(); // replacement for signIn()

      // if (googleUser == null) {
      //   return Left(FirebaseAuthFailure(
      //     AppLocaleKey.googleSignInCancelled.tr()
      //   ));
      // }

      final googleAuth = googleUser.authentication;

      if (googleAuth.idToken == null) {
        return Left(
          FirebaseAuthFailure('AppLocaleKey.failedToGetGoogleCredentials.tr()'),
        );
      }

      return Right(googleAuth.idToken);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.fromGoogleError(e.code));
    } catch (e) {
      return Left(FirebaseAuthFailure(e.toString()));
    }
  }
}
