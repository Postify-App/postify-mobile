import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/routes/app_routers_import.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/auth/data/model/auth_body_model.dart';
import 'package:postify/features/auth/data/model/user_model.dart';
import 'package:postify/features/auth/data/repository/auth_repository.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(const AuthState());

  Future<void> login(AuthBodyModel params) async {
    emit(state.copyWith(loginStatus: CubitStatus.loading));
    final result = await authRepository.sendOtp(params);
    result.fold(
      (failure) => emit(
        state.copyWith(
          loginStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (_) => emit(state.copyWith(loginStatus: CubitStatus.success)),
    );
  }

  Future<void> register(AuthBodyModel params) async {
    emit(state.copyWith(registerStatus: CubitStatus.loading));
    final result = await authRepository.sendOtp(params);
    result.fold(
      (failure) => emit(
        state.copyWith(
          registerStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (_) => emit(state.copyWith(registerStatus: CubitStatus.success)),
    );
  }

  Future<void> verifyOtp(AuthBodyModel params) async {
    emit(state.copyWith(verifyOtpStatus: CubitStatus.loading));
    final result = await authRepository.verifyOtp(params);
    result.fold(
      (failure) => emit(
        state.copyWith(
          verifyOtpStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (user) {
        if (user.accessToken != null) {
          HiveMethods.updateAccessToken(user.accessToken!);
        }
        if (user.refreshToken != null) {
          HiveMethods.updateRefreshToken(user.refreshToken!);
        }
        emit(
          state.copyWith(verifyOtpStatus: CubitStatus.success, userModel: user),
        );
      },
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

    final result = await authRepository.refreshToken(refreshToken);
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
        emit(state.copyWith(userModel: user));
      },
    );
  }

  //! signin with google
  // Future<void> signInWithGoogle({String? profileType}) async {
  //   emit(state.copyWith(signInWithGoogleStatus: CubitStatus.loading));
  //   final result =
  //       await authBaseRepository.signInWithGoogle(profileType: profileType);
  //   result.fold((failure) {
  //     CommonMethods.showError(
  //       message: failure.errMessage,
  //     );
  //     emit(state.copyWith(
  //         signInWithGoogleStatus: CubitStatus.failure,
  //         errorMessage: failure.errMessage));
  //   }, (user) {
  //     HiveMethods.updateAccessToken(user.accessToken);
  //     HiveMethods.updateRefreshToken(user.refreshToken);
  //     emit(state.copyWith(
  //         signInWithGoogleStatus: CubitStatus.success, userModel: user.user));
  //   });
  // }
}
