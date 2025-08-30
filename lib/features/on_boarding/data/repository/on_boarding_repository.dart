import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/on_boarding_model.dart';
import '../../../../core/network/api_consumer.dart';




abstract interface class OnBoardingRepository {

  Future<Either<Failure, OnBoardingModel>> postOnBoarding({
    required String userId,
  });
}


class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final ApiConsumer apiConsumer;
  const OnBoardingRepositoryImpl (this.apiConsumer);

  @override
  Future<Either<Failure, OnBoardingModel>> postOnBoarding({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

