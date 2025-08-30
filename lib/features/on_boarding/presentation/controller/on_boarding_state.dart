part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
    final CubitStatus status;


  const OnBoardingState({this.status = CubitStatus.initial});

  OnBoardingState copyWith({CubitStatus? status}){
    return OnBoardingState(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}