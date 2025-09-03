import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/features/auth/data/model/auth_body_model.dart';
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
      (_) => emit(state.copyWith(verifyOtpStatus: CubitStatus.success)),
    );
  }
}
