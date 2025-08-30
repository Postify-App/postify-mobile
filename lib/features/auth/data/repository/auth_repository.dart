import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/auth_model.dart';
import '../../../../core/network/api_consumer.dart';




abstract interface class AuthRepository {

  Future<Either<Failure, AuthModel>> postAuth({
    required String userId,
  });
}


class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer apiConsumer;
  const AuthRepositoryImpl (this.apiConsumer);

  @override
  Future<Either<Failure, AuthModel>> postAuth({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

