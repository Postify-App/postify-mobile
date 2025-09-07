import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';


part 'businesses_state.dart';

class BusinessesCubit extends Cubit<BusinessesState> {
  BusinessesCubit() : super(const BusinessesState());
}