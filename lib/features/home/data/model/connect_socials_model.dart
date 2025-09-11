import 'package:equatable/equatable.dart';
import 'package:postify/core/images/app_images.dart';

class ConnectSocialsModel extends Equatable {
  final String userSocialImage;
  final String userSocialName;
  final String socialName;
  final String socialIcon;
  final int postsCount;

  const ConnectSocialsModel({
    required this.userSocialImage,
    required this.userSocialName,
    required this.socialName,
    required this.socialIcon,
    required this.postsCount,
  });

  @override
  List<Object?> get props => [
    userSocialImage,
    userSocialName,
    socialName,
    socialIcon,
    postsCount,
  ];
}

List<ConnectSocialsModel> mockConnectSocials = [
  const ConnectSocialsModel(
    userSocialImage: '',
    userSocialName: 'ibrahimFacebook',
    socialName: 'Facebook',
    socialIcon: AppImages.assetsImagesFacebook,
    postsCount: 10,
  ),

  const ConnectSocialsModel(
    userSocialImage: '',
    userSocialName: 'instaIbrahim',
    socialName: 'Instagram',
    socialIcon: AppImages.assetsImagesInstagram,
    postsCount: 5,
  ),

  const ConnectSocialsModel(
    userSocialImage: '',
    userSocialName: '@user4444',
    socialName: 'TikTok',
    socialIcon: AppImages.assetsImagesTiktok,
    postsCount: 2,
  ),

  const ConnectSocialsModel(
    userSocialImage: '',
    userSocialName: '@user456',
    socialName: 'Linkedin',
    socialIcon: AppImages.assetsImagesLinkedin,
    postsCount: 7,
  ),
];
