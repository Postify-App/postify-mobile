import 'dart:io';

import 'package:dio/dio.dart';

class CreatePostBody {
  final String? scheduledAt;
  final File? file;

  CreatePostBody({this.scheduledAt, this.file});

  Future toJson() async {
    return {
      if (scheduledAt != null) 'scheduledAt': scheduledAt,
      if (file != null)
        'file': await MultipartFile.fromFile(
          file!.path,
          filename: file?.path.split('/').last,
        ),
    };
  }
}
