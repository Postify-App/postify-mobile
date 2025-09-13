import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../custom_widgets/bottom_sheet/choose_gallery_or_camera_bottom_sheet.dart';
import '../utils/navigator_methods.dart';

class MediaMethods {
  static final ImagePicker _picker = ImagePicker();

  static Future<bool> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  static Future<bool> _requestStoragePermission() async {
    final status = Platform.isAndroid
        ? await Permission.photos.request()
        : await Permission.storage.request();
    return status.isGranted;
  }

  static Future<void> pickImage({
    required ImageSource source,
    required void Function(File) onSuccess,
  }) async {
    final hasPermission = source == ImageSource.camera
        ? await _requestCameraPermission()
        : await _requestStoragePermission();

    if (!hasPermission) return;

    final XFile? picked = await _picker.pickImage(source: source);
    if (picked != null) {
      onSuccess(File(picked.path));
    }
  }

  static Future<void> pickMultiImage({
    required void Function(List<File>) onSuccess,
  }) async {
    final hasPermission = await _requestStoragePermission();
    if (!hasPermission) return;

    final List<XFile> picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      onSuccess(picked.map((e) => File(e.path)).toList());
    }
  }

  static Future<void> pickVideo({
    required ImageSource source,
    required void Function(File) onSuccess,
  }) async {
    final hasPermission = source == ImageSource.camera
        ? await _requestCameraPermission()
        : await _requestStoragePermission();

    if (!hasPermission) return;

    final XFile? picked = await _picker.pickVideo(source: source);
    if (picked != null) {
      onSuccess(File(picked.path));
    }
  }

  static void pickMediaBottomSheet(
    BuildContext context, {
    required void Function(File) onSuccessCameraImage,
    required void Function(List<File>) onSuccessGalleryImages,
    required void Function(File) onSuccessCameraVideo,
    required void Function(File) onSuccessGalleryVideo,
  }) {
    NavigatorMethods.showAppBottomSheet(
      context,
      ChooseGalleryOrCameraBottomSheet(
        onCameraImage: () => pickImage(
          source: ImageSource.camera,
          onSuccess: onSuccessCameraImage,
        ),
        onGalleryImage: () => pickMultiImage(onSuccess: onSuccessGalleryImages),
        onCameraVideo: () => pickVideo(
          source: ImageSource.camera,
          onSuccess: onSuccessCameraVideo,
        ),
        onGalleryVideo: () => pickVideo(
          source: ImageSource.gallery,
          onSuccess: onSuccessGalleryVideo,
        ),
      ),
    );
  }

  static void pickImageBottomSheet(
    BuildContext context, {
    required void Function(File) onSuccessCamera,
    required void Function(List<File>) onSuccessGallery,
  }) {
    NavigatorMethods.showAppBottomSheet(
      context,
      ChooseGalleryOrCameraBottomSheet(
        onCameraImage: () =>
            pickImage(source: ImageSource.camera, onSuccess: onSuccessCamera),
        onGalleryImage: () => pickMultiImage(onSuccess: onSuccessGallery),
      ),
    );
  }
}
