import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';


part 'initiate_business_state.dart';

class InitiateBusinessCubit extends Cubit<InitiateBusinessState> {
  InitiateBusinessCubit() : super(const InitiateBusinessState());
}