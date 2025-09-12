import 'package:equatable/equatable.dart';
import 'package:postify/core/images/app_images.dart';

class SocialStatsModel extends Equatable {
  final String title;
  final String icon;
  final String value;
  final double percentage;
  final bool isIncrease;

  const SocialStatsModel({
    required this.title,
    required this.icon,
    required this.value,
    required this.percentage,
    required this.isIncrease,
  });

  @override
  List<Object?> get props => [title, icon, value, percentage, isIncrease];
}

List<SocialStatsModel> mockSocialStats = [
  const SocialStatsModel(
    title: 'Reach',
    icon: AppImages.assetsSvgReach,
    value: '3.4K',
    percentage: 81.2,
    isIncrease: true,
  ),
  const SocialStatsModel(
    title: 'Likes',
    icon: AppImages.assetsSvgLikes,
    value: '4.8K',
    percentage: 1.2,
    isIncrease: true,
  ),
  const SocialStatsModel(
    title: 'Comments',
    icon: AppImages.assetsSvgComments,
    value: '7.2K',
    percentage: 5.2,
    isIncrease: false,
  ),
  const SocialStatsModel(
    title: 'Followers',
    icon: AppImages.assetsSvgFollowers,
    value: '5.7K',
    percentage: 9.47,
    isIncrease: true,
  ),
  const SocialStatsModel(
    title: 'Share',
    icon: AppImages.assetsSvgShare,
    value: '6.2K',
    percentage: 22.5,
    isIncrease: true,
  ),
  const SocialStatsModel(
    title: 'Bookmarks',
    icon: AppImages.assetsSvgBookMarks,
    value: '2.74K',
    percentage: 4.2,
    isIncrease: false,
  ),
];
