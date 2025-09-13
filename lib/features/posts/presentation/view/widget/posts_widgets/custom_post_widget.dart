import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/date_methods.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';
import 'package:postify/features/posts/data/model/posts_model.dart';
import 'package:postify/features/posts/presentation/view/screen/post_details_screen.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/scheduled_posts_list_widgets.dart';

class CustomPostWidget extends StatelessWidget {
  const CustomPostWidget({
    super.key,
    this.isLight = false,
    this.button,
    this.post,
  });
  final bool isLight;
  final Widget? button;
  final PostModel? post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 16, top: 24, bottom: 24),
      decoration: BoxDecoration(
        color: isLight
            ? AppColor.secondPrimaryColor(context)
            : AppColor.darkTextColor(context),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post?.title ?? '',
                  style: AppTextStyle.text24BDark(
                    context,
                    color: isLight
                        ? AppColor.darkTextColor(context)
                        : AppColor.lightMainAppColor(context),
                  ),
                  maxLines: 2,
                ),
                5.verticalSpace,
                Divider(
                  color: isLight
                      ? AppColor.darkTextColor(context)
                      : AppColor.lightMainAppColor(context),
                  thickness: 2,
                ),
                5.verticalSpace,
                Text(
                  text,
                  style: AppTextStyle.text13RDark(
                    context,
                    color: isLight
                        ? AppColor.darkTextColor(context)
                        : AppColor.lightMainAppColor(context),
                  ),
                  maxLines: 4,
                ),

                8.verticalSpace,
                Visibility(
                  visible: post?.hashtags?.isNotEmpty ?? false,
                  child: Flexible(
                    child: Row(
                      children: List.generate(
                        post!.hashtags!.length > 2 ? 2 : 0,
                        (index) {
                          return Text(
                            post?.hashtags?[index] ?? '',
                            style: AppTextStyle.text10RSecond(
                              context,
                              color: isLight
                                  ? AppColor.lightMainAppColor(context)
                                  : AppColor.secondAppColor(context),
                            ),
                          ).setContainerToView(
                            color: isLight
                                ? AppColor.darkTextColor(context)
                                : AppColor.lightMainAppColor(context),
                            radius: 100,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            margin: EdgeInsets.only(right: 8.w),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                32.verticalSpace,
                Row(
                  children: [
                    button ??
                        CustomHomeButton(
                          hasShadow: true,
                          text: AppLocaleKey.edit.tr(),
                          color: AppColor.lightMainAppColor(context),
                          width: 145.w,
                          radius: 30,
                          style: AppTextStyle.text16BSecond(context),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(AppImages.assetsSvgOpen),
                          ),
                        ),
                    16.horizontalSpace,
                    Flexible(
                      child: Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              AppLocaleKey.releaseDate.tr(),
                              style: AppTextStyle.text16LLightMain(
                                context,
                                color: isLight
                                    ? AppColor.darkTextColor(context)
                                    : AppColor.lightMainAppColor(context),
                              ),
                            ),
                          ),
                          Text(
                            DateMethods.formatToFullData(
                              post?.scheduledAt?.toIso8601String(),
                            ),
                            style: AppTextStyle.text11BlackLightMain(
                              context,
                              color: isLight
                                  ? AppColor.darkTextColor(context)
                                  : AppColor.lightMainAppColor(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.horizontalSpace,
          Column(
            children: List.generate(socialOptions.length, (index) {
              return Image.asset(socialOptions[index].logo ?? '')
                  .circle(
                    radius: 18,
                    backgroundColor: isLight
                        ? AppColor.darkTextColor(context)
                        : AppColor.lightMainAppColor(context),
                  )
                  .paddingBottom(5);
            }),
          ),
        ],
      ),
    ).onTapScaleAnimation(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailsScreen(postModel: post),
          ),
        );
      },
    );
  }
}
