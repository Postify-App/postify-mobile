part of 'businesses_cubit.dart';

class BusinessesState extends Equatable {
    final CubitStatus status;


  const BusinessesState({this.status = CubitStatus.initial});

  BusinessesState copyWith({CubitStatus? status}){
    return BusinessesState(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}