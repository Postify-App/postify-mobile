part of 'posts_cubit.dart';

class PostsState extends Equatable {
    final CubitStatus status;


  const PostsState({this.status = CubitStatus.initial});

  PostsState copyWith({CubitStatus? status}){
    return PostsState(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}