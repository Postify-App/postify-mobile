import 'package:dartz/dartz.dart';
import 'package:postify/core/network/end_points.dart';
import 'package:postify/core/network/handle_dio_request.dart';
import 'package:postify/features/initiate_business/data/model/create_business_body.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class InitiateBusinessRepository {
  Future<Either<Failure, List<InitiateGeneralModel>>> mainTopics();
  Future<Either<Failure, List<InitiateGeneralModel>>> toneOfVoice();
  Future<Either<Failure, List<InitiateGeneralModel>>> mainGoal();
  Future<Either<Failure, List<InitiateGeneralModel>>> targetAudience();
  Future<Either<Failure, void>> createBusiness(CreateBusinessBody body);
}

class InitiateBusinessRepositoryImpl implements InitiateBusinessRepository {
  final ApiConsumer apiConsumer;
  const InitiateBusinessRepositoryImpl(this.apiConsumer);

  @override
  Future<Either<Failure, List<InitiateGeneralModel>>> mainGoal() async {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(EndPoints.mainGoal);
        return initiateGeneralModelFromJson(response['data']);
      },
    );
  }

  @override
  Future<Either<Failure, List<InitiateGeneralModel>>> mainTopics() async {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(EndPoints.mainTopic);
        return initiateGeneralModelFromJson(response['data']);
      },
    );
  }

  @override
  Future<Either<Failure, List<InitiateGeneralModel>>> targetAudience() async {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(EndPoints.targetAudience);
        return initiateGeneralModelFromJson(response['data']);
      },
    );
  }

  @override
  Future<Either<Failure, List<InitiateGeneralModel>>> toneOfVoice() async {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(EndPoints.toneOfVoice);
        return initiateGeneralModelFromJson(response['data']);
      },
    );
  }

  @override
  Future<Either<Failure, void>> createBusiness(CreateBusinessBody body) {
    return handleDioRequest(
      request: () async {
        await apiConsumer.post(EndPoints.business, body: body.toJson());
      },
    );
  }
}
