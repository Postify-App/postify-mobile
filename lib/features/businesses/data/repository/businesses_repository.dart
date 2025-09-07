import 'package:dartz/dartz.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class BusinessesRepository {
  Future<Either<Failure, BusinessModel>> postBusinesses({
    required String userId,
  });
}

class BusinessesRepositoryImpl implements BusinessesRepository {
  final ApiConsumer apiConsumer;
  const BusinessesRepositoryImpl(this.apiConsumer);

  @override
  Future<Either<Failure, BusinessModel>> postBusinesses({
    required String userId,
  }) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}
