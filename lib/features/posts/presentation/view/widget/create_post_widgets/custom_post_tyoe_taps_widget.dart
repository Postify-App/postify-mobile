import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/features/posts/data/enum/post_writing_type_enum.dart';
import 'package:postify/features/posts/presentation/controller/generate_post_cubit/generate_post_cubit.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/post_writing_type_tap_widget.dart';

class CustomPostTypeTapsWidget extends StatefulWidget {
  const CustomPostTypeTapsWidget({super.key});

  @override
  State<CustomPostTypeTapsWidget> createState() =>
      _CustomPostTypeTapsWidgetState();
}

class _CustomPostTypeTapsWidgetState extends State<CustomPostTypeTapsWidget> {
  ValueNotifier<Set<PostWritingTypeEnum>> tapsNotifier =
      ValueNotifier<Set<PostWritingTypeEnum>>({});

  @override
  void initState() {
    super.initState();
    final cubit = context.read<GeneratePostCubit>();
    final body = cubit.state.generateRequestBody;

    final initialSelections = <PostWritingTypeEnum>{};

    if (body?.hashtags == true) {
      initialSelections.add(PostWritingTypeEnum.HASHTAGS);
    }
    if (body?.emojis == true) {
      initialSelections.add(PostWritingTypeEnum.EMOJIS);
    }

    tapsNotifier.value = initialSelections;
  }

  void _toggleSelection(PostWritingTypeEnum type) {
    final current = Set<PostWritingTypeEnum>.from(tapsNotifier.value);

    if (current.contains(type)) {
      current.remove(type);
    } else {
      current.add(type);
    }

    tapsNotifier.value = current;

    final cubit = context.read<GeneratePostCubit>();
    if (type == PostWritingTypeEnum.HASHTAGS) {
      cubit.setHashtags(current.contains(PostWritingTypeEnum.HASHTAGS));
    } else if (type == PostWritingTypeEnum.EMOJIS) {
      cubit.setEmojis(current.contains(PostWritingTypeEnum.EMOJIS));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<PostWritingTypeEnum>>(
      valueListenable: tapsNotifier,
      builder: (context, selectedTypes, child) {
        return Row(
          children: [
            PostWritingTypeTapWidget(
              isSelected: selectedTypes.contains(PostWritingTypeEnum.HASHTAGS),
              tapName: PostWritingTypeEnum.HASHTAGS,
              onTap: () => _toggleSelection(PostWritingTypeEnum.HASHTAGS),
            ),
            16.horizontalSpace,
            PostWritingTypeTapWidget(
              isSelected: selectedTypes.contains(PostWritingTypeEnum.EMOJIS),
              tapName: PostWritingTypeEnum.EMOJIS,
              onTap: () => _toggleSelection(PostWritingTypeEnum.EMOJIS),
            ),
          ],
        );
      },
    );
  }
}
