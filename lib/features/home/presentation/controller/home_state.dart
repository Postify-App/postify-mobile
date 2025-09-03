part of 'home_cubit.dart';

class HomeState extends Equatable {
    final CubitStatus status;


  const HomeState({this.status = CubitStatus.initial});

  HomeState copyWith({CubitStatus? status}){
    return HomeState(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}