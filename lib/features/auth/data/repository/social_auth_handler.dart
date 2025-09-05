import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:postify/core/error/failures.dart';
import 'package:postify/core/locale/app_locale_key.dart';

class SocialAuthHandler {
  SocialAuthHandler();

  Future<Either<Failure, String?>> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      final googleUser = await googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      if (googleAuth.idToken == null) {
        return Left(
          FirebaseAuthFailure(AppLocaleKey.failedToGetGoogleCredentials.tr()),
        );
      }
      log('Google ID Token: ${googleAuth.idToken}');
      return Right(googleAuth.idToken);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.fromGoogleError(e.code));
    } on GoogleSignInException catch (e) {
      return Left(FirebaseAuthFailure.fromGoogleError(e.code.name));
    } catch (e) {
      return Left(FirebaseAuthFailure(e.toString()));
    }
  }
}
