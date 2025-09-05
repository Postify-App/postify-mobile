part of 'initiate_business_cubit.dart';

class InitiateBusinessState extends Equatable {
    final CubitStatus status;


  const InitiateBusinessState({this.status = CubitStatus.initial});

  InitiateBusinessState copyWith({CubitStatus? status}){
    return InitiateBusinessState(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}