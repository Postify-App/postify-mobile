import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
import 'package:postify/features/map/presentation/view/screen/map_screen.dart';

class LocationFieldWidget extends StatelessWidget {
  const LocationFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitiateBusinessCubit, InitiateBusinessState>(
      buildWhen: (previous, current) =>
          previous.createBusinessBody != current.createBusinessBody,
      builder: (context, state) {
        return CustomFormField(
          hintText: AppLocaleKey.enterLocation.tr(),
          controller: TextEditingController(
            text: state.createBusinessBody?.location ?? '',
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(AppImages.assetsSvgLocation),
          ),
          fillColor: AppColor.lightMainAppColor(context),
          readOnly: true,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                  value: context.read<InitiateBusinessCubit>(),
                  child: MapScreen(
                    args: MapScreenArgs(
                      latLng:
                          state.createBusinessBody?.latitude != null &&
                              state.createBusinessBody?.longitude != null
                          ? LatLng(
                              double.parse(state.createBusinessBody!.latitude!),
                              double.parse(
                                state.createBusinessBody!.longitude!,
                              ),
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
