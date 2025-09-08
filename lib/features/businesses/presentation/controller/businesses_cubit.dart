import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import 'package:postify/features/businesses/data/repository/businesses_repository.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';

part 'businesses_state.dart';

class BusinessesCubit extends Cubit<BusinessesState> {
  final BusinessesRepository businessesRepository;
  BusinessesCubit(this.businessesRepository) : super(const BusinessesState());

  Future<void> getBusinesses() async {
    emit(state.copyWith(getBusinessesStatus: CubitStatus.loading));
    final failureOrBusinesses = await businessesRepository.getBusinesses();
    failureOrBusinesses.fold(
      (failure) => emit(
        state.copyWith(
          getBusinessesStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (businesses) => emit(
        state.copyWith(
          getBusinessesStatus: CubitStatus.success,
          businesses: businesses,
        ),
      ),
    );
  }
}
