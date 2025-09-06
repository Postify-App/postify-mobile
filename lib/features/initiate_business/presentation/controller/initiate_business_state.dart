part of 'initiate_business_cubit.dart';

class InitiateBusinessState extends Equatable {
  final CubitStatus status;
  final int currentPage;

  const InitiateBusinessState({
    this.status = CubitStatus.initial,
    this.currentPage = 0,
  });

  InitiateBusinessState copyWith({
    CubitStatus? status,
    int? currentPage,
  }) {
    return InitiateBusinessState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [status, currentPage];
}
