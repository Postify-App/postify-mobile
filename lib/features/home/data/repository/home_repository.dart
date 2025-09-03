import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/home_model.dart';
import '../../../../core/network/api_consumer.dart';




abstract interface class HomeRepository {

  Future<Either<Failure, HomeModel>> postHome({
    required String userId,
  });
}


class HomeRepositoryImpl implements HomeRepository {
  final ApiConsumer apiConsumer;
  const HomeRepositoryImpl (this.apiConsumer);

  @override
  Future<Either<Failure, HomeModel>> postHome({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

