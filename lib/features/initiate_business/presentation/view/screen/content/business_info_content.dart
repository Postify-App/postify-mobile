import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/custom_widgets/overlay/custom_text_form_feild_drop_down_overlay.dart';
import 'package:postify/core/custom_widgets/validation/validation_mixin.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_upload_business_logo.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/location_field_widget.dart';

import '../../../../../../core/common/debouncer.dart';

class BusinessInfoContent extends StatefulWidget {
  const BusinessInfoContent({super.key});

  @override
  State<BusinessInfoContent> createState() => _BusinessInfoContentState();
}

class _BusinessInfoContentState extends State<BusinessInfoContent>
    with ValidationMixin {
  late final Debouncer _nameDebouncer;
  late final Debouncer _descriptionDebouncer;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  ValueNotifier<String?> selectedBusinessSize = ValueNotifier(null);
  ValueNotifier<File?> selectedLogo = ValueNotifier(null);

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameDebouncer = Debouncer(delay: const Duration(milliseconds: 500));
    _descriptionDebouncer = Debouncer(delay: const Duration(milliseconds: 500));
    final initiateBusinessState = context.read<InitiateBusinessCubit>().state;
    nameController.text = initiateBusinessState.createBusinessBody?.name ?? '';
    emailController.text =
        initiateBusinessState.createBusinessBody?.email ?? '';
    descriptionController.text =
        initiateBusinessState.createBusinessBody?.description ?? '';
    selectedBusinessSize.value = initiateBusinessState.createBusinessBody?.size;
    selectedLogo.value = initiateBusinessState.createBusinessBody?.logo;
  }

  @override
  void dispose() {
    _nameDebouncer.dispose();
    _descriptionDebouncer.dispose();
    super.dispose();
  }

  List<CustomSelectDropdownItem> businessSizes = [
    CustomSelectDropdownItem(value: "small", name: "Small"),
    CustomSelectDropdownItem(value: "medium", name: "Medium"),
    CustomSelectDropdownItem(value: "large", name: "Large"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
              controller: nameController,
              onChanged: (value) {
                _nameDebouncer(() {
                  context.read<InitiateBusinessCubit>().setBusinessInfo(
                    name: value,
                  );
                });
              },
            ),
            CustomFormField(
              hintText: AppLocaleKey.enterEmailAddress.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppImages.assetsSvgEmailFeild),
              ),
              fillColor: AppColor.lightMainAppColor(context),
              controller: emailController,
              onChanged: (value) {
                if (formKey.currentState!.validate()) {
                  context.read<InitiateBusinessCubit>().setBusinessInfo(
                    email: value,
                  );
                }
              },
              validator: validateEmail,
            ),
            CustomFormField(
              hintText: AppLocaleKey.businessDescription.tr(),
              maxLines: 4,
              fillColor: AppColor.lightMainAppColor(context),
              controller: descriptionController,
              onChanged: (value) {
                _descriptionDebouncer(() {
                  context.read<InitiateBusinessCubit>().setBusinessInfo(
                    description: value,
                  );
                });
              },
            ),
            const LocationFieldWidget(),
            CustomTextFormFieldDropdownOverlay(
              inCenter: true,
              items: businessSizes,
              onItemSelected: (value) {
                context.read<InitiateBusinessCubit>().setBusinessInfo(
                  size: value,
                );
              },
              selectedItem: selectedBusinessSize.value,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppImages.assetsSvgBusinessSize),
              ),
              hintText: AppLocaleKey.businessSize.tr(),
              fillColor: AppColor.lightMainAppColor(context),
            ),
            CustomUploadBusinessLogo(selectedLogo: selectedLogo),
          ],
        ),
      ),
    );
  }
}
