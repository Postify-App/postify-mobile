import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';


part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(const PostsState());
}