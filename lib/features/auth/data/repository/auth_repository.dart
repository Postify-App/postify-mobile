import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/network/end_points.dart';
import 'package:postify/core/network/handle_dio_request.dart';
import 'package:postify/features/auth/data/model/user_model.dart';
import 'package:postify/features/auth/data/repository/social_auth_handler.dart';
import '../../../../core/error/failures.dart';
import '../model/auth_body_model.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> sendOtp(AuthBodyModel body);
  Future<Either<Failure, UserModel>> verifyOtp(AuthBodyModel body);
  
  Future<Either<Failure, UserModel>> signInWithGoogle();
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer apiConsumer;
  final SocialAuthHandler socialAuthHandler;
  const AuthRepositoryImpl(this.apiConsumer, this.socialAuthHandler);



  @override
  Future<Either<Failure, void>> sendOtp(AuthBodyModel body) {
    return handleDioRequest(
      request: () async {
        return apiConsumer.post(EndPoints.sendOtp, body: body.toJson());
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> verifyOtp(AuthBodyModel body) {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.post(
          EndPoints.verifyOtp,
          body: body.toJson(),
        );
        return UserModel.fromJson(response);
      },
    );
  }

  //! sign in with google

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    final socialCredential = await socialAuthHandler.signInWithGoogle();
    if (socialCredential.isLeft()) {
      return Left(
        socialCredential.fold(
          (failure) => failure,
          (_) => ServerFailure("AppLocaleKey.unknownError.tr()"),
        ),
      );
    }

    final googleIdToken = socialCredential.getOrElse(() => null);
    if (googleIdToken == null) {
      return Left(
        ServerFailure(AppLocaleKey.failedToGetGoogleCredentials.tr()),
      );
    }

    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.post(
          EndPoints.verifyOtp,
          body: {"idToken": googleIdToken},
        );
        return UserModel.fromJson(response);
      },
    );
  }
}
