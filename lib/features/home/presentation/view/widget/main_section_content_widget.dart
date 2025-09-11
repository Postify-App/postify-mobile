import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/home/presentation/view/widget/connect_socials_section_widget.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_suffix_circle_icon.dart';
import 'package:postify/features/profile/presentation/controller/profile_cubit.dart';

class MainSectionContentWidget extends StatelessWidget {
  const MainSectionContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var businessModel = state.selectedBusiness;
        var profileModel = state.profileModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "${AppLocaleKey.goodMorning.tr()}, ",
                  style: AppTextStyle.text24BDark(context),
                ),

                Text(
                  profileModel?.name ?? '',
                  style: AppTextStyle.text24BDark(context),
                ),
              ],
            ),
            Text(
              AppLocaleKey.scheduledPosts.tr(namedArgs: {'count': '4'}),
              style: AppTextStyle.text16RSecond(
                context,
                color: AppColor.darkTextColor(context),
              ),
            ),
            16.verticalSpace,
            Divider(
              color: AppColor.darkTextColor(context),
              thickness: 1,
              height: 1,
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    businessModel?.name ?? '',
                    style: AppTextStyle.text32BSecond(
                      context,
                      color: AppColor.whiteColor(context),
                    ).copyWith(height: 1.1),
                  ),
                ),
                16.horizontalSpace,
                Row(
                  children: [
                    CustomSuffixCircleIcon(icon: businessModel?.logo ?? ''),
                    16.horizontalSpace,
                    CustomSuffixCircleIcon(icon: businessModel?.logo ?? ''),
                  ],
                ),
              ],
            ),
            25.verticalSpace,
            const ConnectSocialsSectionWidget(),
          ],
        );
      },
    );
  }
}
