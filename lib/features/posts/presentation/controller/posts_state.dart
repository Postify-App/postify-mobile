part of 'posts_cubit.dart';

class PostsState extends Equatable {
  final CubitStatus createPostStatus;
  final CubitStatus getScheduledPostsStatus;
  final CubitStatus getPostedPostsStatus;
  final CubitStatus showPostStatus;
  final PostModel? post;
  final List<PostModel> scheduledPosts;
  final List<PostModel> postedPosts;
  final String errorMessage;

  const PostsState({
    this.createPostStatus = CubitStatus.initial,
    this.getScheduledPostsStatus = CubitStatus.initial,
    this.getPostedPostsStatus = CubitStatus.initial,
    this.showPostStatus = CubitStatus.initial,
    this.post,
    this.scheduledPosts = const [],
    this.postedPosts = const [],
    this.errorMessage = '',
  });

  PostsState copyWith({
    CubitStatus? createPostStatus,
    CubitStatus? getScheduledPostsStatus,
    CubitStatus? getPostedPostsStatus,
    CubitStatus? showPostStatus,
    PostModel? post,
    List<PostModel>? scheduledPosts,
    List<PostModel>? postedPosts,
    String? errorMessage,
  }) {
    return PostsState(
      createPostStatus: createPostStatus ?? this.createPostStatus,
      getScheduledPostsStatus: getScheduledPostsStatus ?? this.getScheduledPostsStatus,
      getPostedPostsStatus: getPostedPostsStatus ?? this.getPostedPostsStatus,  
      showPostStatus: showPostStatus ?? this.showPostStatus,
      post: post ?? this.post,
      scheduledPosts: scheduledPosts ?? this.scheduledPosts,
      postedPosts: postedPosts ?? this.postedPosts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    createPostStatus,
    getScheduledPostsStatus,
    getPostedPostsStatus,
    showPostStatus,
    post,
    scheduledPosts,
    postedPosts,
    errorMessage
  ];
}
