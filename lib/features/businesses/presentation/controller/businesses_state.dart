part of 'businesses_cubit.dart';

class BusinessesState extends Equatable {
  final CubitStatus getBusinessesStatus;
  final List<BusinessModel> businesses;
  final String errorMessage;

  const BusinessesState({
    this.getBusinessesStatus = CubitStatus.initial,
    this.businesses = const [],
    this.errorMessage = '',
  });

  BusinessesState copyWith({
    CubitStatus? getBusinessesStatus,
    List<BusinessModel>? businesses,
    String? errorMessage,
  }) {
    return BusinessesState(
      getBusinessesStatus: getBusinessesStatus ?? this.getBusinessesStatus,
      businesses: businesses ?? this.businesses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [getBusinessesStatus, businesses, errorMessage];
}
