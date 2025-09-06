import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/locale/app_locale_key.dart';

class CustomConfirmLocationButtonWidget extends StatelessWidget {
  const CustomConfirmLocationButtonWidget({super.key, this.selectedPlace});

  final PickResult? selectedPlace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomButton(
        text: AppLocaleKey.confirm.tr(),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
