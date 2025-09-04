part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final CubitStatus loginStatus;
  final CubitStatus registerStatus;
  final CubitStatus verifyOtpStatus;
  final CubitStatus signInWithGoogleStatus;
  final UserModel? userModel;
  final String errorMessage;

  const AuthState({
    this.loginStatus = CubitStatus.initial,
    this.registerStatus = CubitStatus.initial,
    this.verifyOtpStatus = CubitStatus.initial,
    this.signInWithGoogleStatus = CubitStatus.initial,
    this.userModel,
    this.errorMessage = '',
  });

  AuthState copyWith({
    CubitStatus? loginStatus,
    CubitStatus? registerStatus,
    CubitStatus? verifyOtpStatus,
    CubitStatus? signInWithGoogleStatus,
    UserModel? userModel,
    String? errorMessage,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      registerStatus: registerStatus ?? this.registerStatus,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      signInWithGoogleStatus:
          signInWithGoogleStatus ?? this.signInWithGoogleStatus,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loginStatus,
    registerStatus,
    verifyOtpStatus,
    signInWithGoogleStatus,
    userModel,
    errorMessage,
  ];
}
