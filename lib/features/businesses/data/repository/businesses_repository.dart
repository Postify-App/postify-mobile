import 'package:dartz/dartz.dart';
import 'package:postify/core/network/end_points.dart';
import 'package:postify/core/network/handle_dio_request.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class BusinessesRepository {
  Future<Either<Failure, List<BusinessModel>>> getBusinesses();
}

class BusinessesRepositoryImpl implements BusinessesRepository {
  final ApiConsumer apiConsumer;
  const BusinessesRepositoryImpl(this.apiConsumer);

  @override
  Future<Either<Failure, List<BusinessModel>>> getBusinesses() {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(EndPoints.getBusinesses);
        return businessModelFromJson(response['data']);
      },
    );
  }
}
