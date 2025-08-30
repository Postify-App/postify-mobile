part of 'auth_cubit.dart';

class AuthState extends Equatable {
    final CubitStatus status;


  const AuthState({this.status = CubitStatus.initial});

  AuthState copyWith({CubitStatus? status}){
    return AuthState(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}