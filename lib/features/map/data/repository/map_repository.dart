import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/map_model.dart';
import '../../../../core/network/api_consumer.dart';




abstract interface class MapRepository {

  Future<Either<Failure, MapModel>> postMap({
    required String userId,
  });
}


class MapRepositoryImpl implements MapRepository {
  final ApiConsumer apiConsumer;
  const MapRepositoryImpl (this.apiConsumer);

  @override
  Future<Either<Failure, MapModel>> postMap({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

