import 'package:dartz/dartz.dart';
import 'package:postify/core/network/end_points.dart';
import 'package:postify/core/network/handle_dio_request.dart';
import '../../../../core/error/failures.dart';
import '../model/auth_body_model.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> sendOtp(AuthBodyModel body);
  Future<Either<Failure, void>> verifyOtp(AuthBodyModel body);
  Future<Either<Failure, void>> refreshToken(AuthBodyModel body);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer apiConsumer;
  const AuthRepositoryImpl(this.apiConsumer);

  @override
  Future<Either<Failure, void>> refreshToken(AuthBodyModel body) {
    return handleDioRequest(
      request: () async {
        return apiConsumer.post(EndPoints.refreshToken, body: body.toJson());
      },
    );
  }

  @override
  Future<Either<Failure, void>> sendOtp(AuthBodyModel body) {
    return handleDioRequest(
      request: () async {
        return apiConsumer.post(EndPoints.sendOtp, body: body.toJson());
      },
    );
  }

  @override
  Future<Either<Failure, void>> verifyOtp(AuthBodyModel body) {
    return handleDioRequest(
      request: () async {
        return apiConsumer.post(EndPoints.verifyOtp, body: body.toJson());
      },
    );
  }
}
