import 'package:dartz/dartz.dart';
import 'package:postify/core/network/end_points.dart';
import 'package:postify/core/network/handle_dio_request.dart';
import 'package:postify/features/auth/data/model/user_model.dart';
import '../../../../core/error/failures.dart';
import '../model/profile_model.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class ProfileRepository {
  // Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, UserModel>> refreshToken(String refreshToken);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiConsumer apiConsumer;
  const ProfileRepositoryImpl(this.apiConsumer);

  // @override
  // Future<Either<Failure, ProfileModel>> getProfile() {
  //   return handleDioRequest(
  //     request: () async {
  //       final response = await apiConsumer.get(EndPoints.profile);
  //       return ProfileModel.fromJson(response['data']);
  //     },
  //   );
  // }

  @override
  Future<Either<Failure, UserModel>> refreshToken(String refreshToken) {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.post(
          EndPoints.refreshToken,
          body: {'refreshToken': refreshToken},
        );
        return UserModel.fromJson(response);
      },
    );
  }
}
