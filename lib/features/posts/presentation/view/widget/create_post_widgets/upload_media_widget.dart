import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/images/media_methods.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:video_player/video_player.dart';

class UploadMediaWidget extends StatelessWidget {
  final ValueNotifier<File?> mediaNotifier;

  const UploadMediaWidget({super.key, required this.mediaNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
      valueListenable: mediaNotifier,
      builder: (context, file, _) {
        return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (file == null) ...[
                  SvgPicture.asset(AppImages.assetsSvgUpload),
                  8.verticalSpace,
                  Text(
                    AppLocaleKey.uploadMedia.tr(),
                    style: AppTextStyle.text16RDark(context),
                  ),
                ] else if (file.path.endsWith(".mp4")) ...[
                  _VideoPreview(file: file),
                ] else ...[
                  Image.file(file, height: 100, fit: BoxFit.cover),
                ],
              ],
            )
            .setContainerToView(
              color: AppColor.secondPrimaryColor(context),
              radius: 12,
            )
            .onTapScaleAnimation(
              onTap: () {
                MediaMethods.pickMediaBottomSheet(
                  context,
                  onSuccessCameraImage: (file) => mediaNotifier.value = file,
                  onSuccessGalleryImages: (files) =>
                      mediaNotifier.value = files.first,
                  onSuccessCameraVideo: (file) => mediaNotifier.value = file,
                  onSuccessGalleryVideo: (file) => mediaNotifier.value = file,
                );
              },
            )
            .paddingAll(8)
            .setContainerToView(
              shadows: [
                const BoxShadow(
                  color: Color(0xFF3A3A3A),
                  blurRadius: 0,
                  offset: Offset(-2, 5),
                  spreadRadius: 0,
                ),
                const BoxShadow(
                  color: Color(0x59000000),
                  blurRadius: 50,
                  offset: Offset(0, 0),
                  spreadRadius: -25,
                ),
              ],
              borderColor: AppColor.secondAppColor(context),
              radius: 12,
              color: AppColor.lightMainAppColor(context),
              margin: const EdgeInsets.only(top: 16, bottom: 24),
              height: 172.h,
              width: double.infinity,
            );
      },
    );
  }
}

class _VideoPreview extends StatefulWidget {
  final File file;
  const _VideoPreview({required this.file});

  @override
  State<_VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<_VideoPreview> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {}); // يعمل rebuild بعد ما الفيديو يجهز
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller),
          IconButton(
            icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          ),
        ],
      ),
    );
  }
}
