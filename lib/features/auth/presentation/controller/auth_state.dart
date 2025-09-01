part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final CubitStatus loginStatus;
  final CubitStatus registerStatus;
  final CubitStatus verifyOtpStatus;
  final String errorMessage;

  const AuthState({
    this.loginStatus = CubitStatus.initial,
    this.registerStatus = CubitStatus.initial,
    this.verifyOtpStatus = CubitStatus.initial,
    this.errorMessage = '',
  });

  AuthState copyWith({
    CubitStatus? loginStatus,
    CubitStatus? registerStatus,
    CubitStatus? verifyOtpStatus,
    String? errorMessage,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      registerStatus: loginStatus ?? this.registerStatus,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    loginStatus,
    registerStatus,
    verifyOtpStatus,
    errorMessage,
  ];
}
