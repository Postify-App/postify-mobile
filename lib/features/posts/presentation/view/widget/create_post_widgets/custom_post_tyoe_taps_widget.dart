import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/features/posts/data/enum/post_writing_type_enum.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/post_writing_type_tap_widget.dart';

class CustomPostTypeTapsWidget extends StatefulWidget {
  const CustomPostTypeTapsWidget({super.key});

  @override
  State<CustomPostTypeTapsWidget> createState() =>
      _CustomPostTypeTapsWidgetState();
}

class _CustomPostTypeTapsWidgetState extends State<CustomPostTypeTapsWidget> {
  ValueNotifier<PostWritingTypeEnum> tapNotifier = ValueNotifier(
    PostWritingTypeEnum.HASHTAGS,
  );
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tapNotifier,
      builder: (context, value, child) {
        return Row(
          children: [
            PostWritingTypeTapWidget(
              isSelected: tapNotifier.value == PostWritingTypeEnum.HASHTAGS,
              tapName: PostWritingTypeEnum.HASHTAGS,
              onTap: () {
                tapNotifier.value = PostWritingTypeEnum.HASHTAGS;
              },
            ),
            16.horizontalSpace,
            PostWritingTypeTapWidget(
              isSelected: tapNotifier.value == PostWritingTypeEnum.EMOJIS,
              tapName: PostWritingTypeEnum.EMOJIS,
              onTap: () {
                tapNotifier.value = PostWritingTypeEnum.EMOJIS;
              },
            ),
          ],
        );
      },
    );
  }
}