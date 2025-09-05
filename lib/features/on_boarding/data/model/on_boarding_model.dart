import 'package:equatable/equatable.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';

class OnBoardingModel extends Equatable {
  final String title;
  final String description;
  final String image;

  const OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  List<Object> get props => [title, description, image];
}

List<OnBoardingModel> onBoardingList = [
  const OnBoardingModel(
    title: AppLocaleKey.welcomeToPostify,
    description: AppLocaleKey.introText,
    image: AppImages.assetsImagesOnBoarding1,
  ),
  const OnBoardingModel(
    title: AppLocaleKey.shareEffortlessly,
    description: AppLocaleKey.shareEffortlesslyDesc,
    image: AppImages.assetsImagesOnBoarding2,
  ),
  const OnBoardingModel(
    title: AppLocaleKey.discoverWhatMatters,
    description: AppLocaleKey.discoverWhatMattersDesc,
    image: AppImages.assetsImagesOnBoarding3,
  ),
];
