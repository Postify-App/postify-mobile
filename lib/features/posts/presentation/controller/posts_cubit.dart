import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postify/features/posts/data/enum/posts_type_enum.dart';
import 'package:postify/features/posts/data/model/create_post_body.dart';
import 'package:postify/features/posts/data/model/posts_model.dart';
import 'package:postify/features/posts/data/repository/posts_repository.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepository postsRepository;
  PostsCubit(this.postsRepository) : super(const PostsState());

  Future<void> getScheduledPosts({required String businessId}) async {
    emit(state.copyWith(getScheduledPostsStatus: CubitStatus.loading));
    final result = await postsRepository.getPosts(
      businessId: businessId,
      status: PostsTypeEnum.scheduled,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          getScheduledPostsStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (scheduledPosts) => emit(
        state.copyWith(
          getScheduledPostsStatus: CubitStatus.success,
          scheduledPosts: scheduledPosts,
        ),
      ),
    );
  }

  Future<void> getPostedPosts({required String businessId}) async {
    emit(state.copyWith(getPostedPostsStatus: CubitStatus.loading));
    final result = await postsRepository.getPosts(
      businessId: businessId,
      status: PostsTypeEnum.posted,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          getPostedPostsStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (postedPosts) => emit(
        state.copyWith(
          getPostedPostsStatus: CubitStatus.success,
          postedPosts: postedPosts,
        ),
      ),
    );
  }

  Future<void> showPost({required String postId}) async {
    emit(state.copyWith(showPostStatus: CubitStatus.loading));
    final result = await postsRepository.showPost(postId: postId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          showPostStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (post) =>
          emit(state.copyWith(showPostStatus: CubitStatus.success, post: post)),
    );
  }

  Future<void> publishPost({
    required String businessId,
    required CreatePostBody body,
  }) async {
    emit(state.copyWith(createPostStatus: CubitStatus.loading));
    final result = await postsRepository.publishPost(
      businessId: businessId,
      body: body,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          createPostStatus: CubitStatus.failure,
          errorMessage: failure.errMessage,
        ),
      ),
      (post) => emit(
        state.copyWith(createPostStatus: CubitStatus.success, post: post),
      ),
    );
  }
}
