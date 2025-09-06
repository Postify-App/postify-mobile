import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';


part 'initiate_business_state.dart';

class InitiateBusinessCubit extends Cubit<InitiateBusinessState> {
  InitiateBusinessCubit() : super(const InitiateBusinessState());

  final List<InitiateBusinessStepType> steps = [
    InitiateBusinessStepType.topic,
    InitiateBusinessStepType.tone,
    InitiateBusinessStepType.target,
    InitiateBusinessStepType.businessInfo,
    InitiateBusinessStepType.social,
  ];

  void nextPage() {
    if (state.currentPage < steps.length - 1) {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void setPage(int index) {
    emit(state.copyWith(currentPage: index));
  }
}
