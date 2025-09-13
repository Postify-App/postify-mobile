import 'package:dartz/dartz.dart';
import 'package:postify/core/network/end_points.dart';
import 'package:postify/core/network/handle_dio_request.dart';
import 'package:postify/features/posts/data/enum/posts_type_enum.dart';
import 'package:postify/features/posts/data/model/create_post_body.dart';
import '../../../../core/error/failures.dart';
import '../model/posts_model.dart';
import '../../../../core/network/api_consumer.dart';

abstract interface class PostsRepository {
  Future<Either<Failure, PostModel>> publishPost({
    required String businessId,
    required CreatePostBody body,
  });
  Future<Either<Failure, List<PostModel>>> getPosts({
    required String businessId,
    required PostsTypeEnum status,
  });
  Future<Either<Failure, PostModel>> showPost({required String postId});
}

class PostsRepositoryImpl implements PostsRepository {
  final ApiConsumer apiConsumer;
  const PostsRepositoryImpl(this.apiConsumer);

  @override
  Future<Either<Failure, List<PostModel>>> getPosts({
    required String businessId,
    required PostsTypeEnum status,
  }) {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(
          EndPoints.businessesPosts(businessId),
          queryParameters: {'status': status.name},
        );
        return postModelFromJson(response['data']);
      },
    );
  }

  @override
  Future<Either<Failure, PostModel>> publishPost({
    required String businessId,
    required CreatePostBody body,
  }) {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.post(
          EndPoints.publishPost(businessId),
          body: await body.toJson(),
          isFormData: true,
        );
        return PostModel.fromJson(response['data']);
      },
    );
  }

  @override
  Future<Either<Failure, PostModel>> showPost({required String postId}) {
    return handleDioRequest(
      request: () async {
        final response = await apiConsumer.get(EndPoints.showPost(postId));
        return PostModel.fromJson(response['data']);
      },
    );
  }
}
