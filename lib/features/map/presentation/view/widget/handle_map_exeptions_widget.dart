import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/map/presentation/controller/map_cubit.dart';

class HandleMapExceptionsWidget extends StatelessWidget {
  const HandleMapExceptionsWidget({
    super.key,
    required this.errorMessage,
    required this.defaultLocation,
  });
  final String errorMessage;
  final LatLng defaultLocation;

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_off, size: 64, color: Colors.grey[400]),
        const SizedBox(height: 16),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: AppTextStyle.text16MSecond(context),
        ),
        const SizedBox(height: 24),
        CustomButton(
          text: AppLocaleKey.selectLocation.tr(),
          onPressed: () {
            mapCubit.openAppSettings().then((_) {
              mapCubit.determinePosition();
            });
          },
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {
            mapCubit.setCustomPosition(defaultLocation);
          },
          icon: const Icon(Icons.map_outlined),
          label: Text(AppLocaleKey.continueWithoutCurrentLocation.tr()),
          style: TextButton.styleFrom(minimumSize: const Size(200, 48)),
        ),
      ],
    );
  }
}
