import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/routes/app_routers_import.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import 'package:postify/features/profile/data/model/profile_model.dart';
import 'package:postify/features/profile/data/repository/profile_repository.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(const ProfileState());

  Future<void> getProfile() async {
    emit(state.copyWith(getProfileStatus: CubitStatus.loading));
    final result = await profileRepository.getProfile();
    result.fold(
      (failure) => emit(
        state.copyWith(
          getProfileStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (profileModel) => emit(
        state.copyWith(
          getProfileStatus: CubitStatus.success,
          profileModel: profileModel,
        ),
      ),
    );
  }

  //! refresh token if it is expired
  Future<void> refreshToken() async {
    final refreshToken = HiveMethods.getRefreshToken();

    if (refreshToken == null) {
      CommonMethods.showError(message: 'refresh token is null');
      HiveMethods.deleteTokens();
      NavigatorMethods.pushNamedAndRemoveUntil(
        AppRouters.navigatorKey.currentContext!,
        RoutesName.loginScreen,
      );
      return;
    }

    final result = await profileRepository.refreshToken(refreshToken);
    result.fold(
      (failure) {
        CommonMethods.showError(message: failure.errMessage);
        HiveMethods.deleteTokens();
        NavigatorMethods.pushNamedAndRemoveUntil(
          AppRouters.navigatorKey.currentContext!,
          RoutesName.loginScreen,
        );
      },
      (user) {
        if (user.accessToken != null) {
          HiveMethods.updateAccessToken(user.accessToken!);
        }
        emit(state.copyWith(profileModel: user.data));
      },
    );
  }

  void updateProfile(ProfileModel? profileModel) {
    emit(state.copyWith(profileModel: profileModel));
  }

  void updateSelectedBusiness(BusinessModel? businessModel) {
    emit(state.copyWith(selectedBusiness: businessModel));
  }
}
