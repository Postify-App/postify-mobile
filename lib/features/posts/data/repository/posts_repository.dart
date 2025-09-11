import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/posts_model.dart';
import '../../../../core/network/api_consumer.dart';




abstract interface class PostsRepository {

  Future<Either<Failure, PostsModel>> postPosts({
    required String userId,
  });
}


class PostsRepositoryImpl implements PostsRepository {
  final ApiConsumer apiConsumer;
  const PostsRepositoryImpl (this.apiConsumer);

  @override
  Future<Either<Failure, PostsModel>> postPosts({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

