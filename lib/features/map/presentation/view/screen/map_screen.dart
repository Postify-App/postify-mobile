import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postify/core/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:postify/core/custom_widgets/custom_loading/custom_loading.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/map/presentation/controller/map_cubit.dart';
import 'package:postify/features/map/presentation/view/widget/custom_place_picker_map_widget.dart';
import 'package:postify/features/map/presentation/view/widget/handle_map_exeptions_widget.dart';

class MapScreenArgs {
  final LatLng? latLng;
  MapScreenArgs({this.latLng});
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, this.args});
  final MapScreenArgs? args;

  static const LatLng _defaultLocation = LatLng(24.7136, 46.6753);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit()..determinePosition(initialLatLng: args?.latLng),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: CustomAppBar(
              context,
              title: Text(
                AppLocaleKey.businessLocation.tr(),
                style: AppTextStyle.text16MSecond(context),
              ),
            ),
            body: state.isLoading
                ? const Center(child: CustomLoading())
                : state.errorMessage != null
                ? HandleMapExceptionsWidget(
                    errorMessage: state.errorMessage!,
                    defaultLocation: _defaultLocation,
                  )
                : CustomPlacePickerMapWidget(
                    isUpdate: args?.latLng != null,
                    defaultLocation: _defaultLocation,
                    initPosition: state.initPosition,
                  ),
          );
        },
      ),
    );
  }
}
