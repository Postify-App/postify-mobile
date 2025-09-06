import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/custom_widgets/overlay/custom_text_form_feild_drop_down_overlay.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_upload_business_logo.dart';

class BusinessInfoContent extends StatefulWidget {
  const BusinessInfoContent({super.key});

  @override
  State<BusinessInfoContent> createState() => _BusinessInfoContentState();
}

class _BusinessInfoContentState extends State<BusinessInfoContent> {
  final TextEditingController businessNameEc = TextEditingController();
  final TextEditingController emailEc = TextEditingController();
  final TextEditingController descriptionEc = TextEditingController();
  final TextEditingController locationEc = TextEditingController();
  ValueNotifier<String?> selectedBusinessSize = ValueNotifier<String?>(null);
  ValueNotifier<String?> selectedLogo = ValueNotifier<String?>(null);

  @override
  void dispose() {
    super.dispose();
    businessNameEc.dispose();
    emailEc.dispose();
    descriptionEc.dispose();
    locationEc.dispose();
    selectedBusinessSize.dispose();
    selectedLogo.dispose();
  }

  List<CustomSelectDropdownItem> businessSizes = [
    CustomSelectDropdownItem(value: "1-10", name: "1-10"),
    CustomSelectDropdownItem(value: "11-50", name: "11-50"),
    CustomSelectDropdownItem(value: "51-200", name: "51-200"),
    CustomSelectDropdownItem(value: "201-500", name: "201-500"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          16.verticalSpace,
          CustomFormField(
            hintText: AppLocaleKey.enterBusinessName.tr(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.assetsSvgNameFeild),
            ),
            fillColor: AppColor.lightMainAppColor(context),
          ),
          CustomFormField(
            hintText: AppLocaleKey.enterEmailAddress.tr(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.assetsSvgEmailFeild),
            ),
            fillColor: AppColor.lightMainAppColor(context),
          ),
          CustomFormField(
            hintText: AppLocaleKey.businessDescription.tr(),
            maxLines: 4,
            fillColor: AppColor.lightMainAppColor(context),
          ),
          CustomFormField(
            hintText: AppLocaleKey.enterLocation.tr(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.assetsImagesLocation),
            ),
            fillColor: AppColor.lightMainAppColor(context),
            readOnly: true,
            onTap: () =>
                NavigatorMethods.pushNamed(context, RoutesName.mapScreen),
          ),
          CustomTextFormFieldDropdownOverlay(
            items: businessSizes,
            onItemSelected: (value) {
              selectedBusinessSize.value = value;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.assetsImagesBusinessSize),
            ),
            hintText: AppLocaleKey.businessSize.tr(),
            fillColor: AppColor.lightMainAppColor(context),
          ),
          CustomUploadBusinessLogo(selectedLogo: selectedLogo),
        ],
      ),
    );
  }
}
