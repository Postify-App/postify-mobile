import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/utils/constants.dart';
import 'package:postify/features/map/presentation/view/widget/custom_confirm_location_button_widget.dart';

class CustomPlacePickerMapWidget extends StatelessWidget {
  const CustomPlacePickerMapWidget({
    super.key,
    required this.isUpdate,
    required this.defaultLocation,
    required this.initPosition,
  });

  final bool? isUpdate;
  final LatLng defaultLocation;
  final LatLng initPosition;

  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      searchForInitialValue: true,
      selectInitialPosition: true,
      hintText: AppLocaleKey.searchAboutLocation.tr(),
      automaticallyImplyAppBarLeading: false,
      apiKey: Constants.googleMapsApiKey,
      resizeToAvoidBottomInset: true,
      useCurrentLocation: isUpdate == false,
      initialPosition: initPosition,
      onPlacePicked: (result) => Navigator.pop(context, result),
      selectedPlaceWidgetBuilder:
          (_, selectedPlace, pickerState, isSearchBarFocused) {
            return isSearchBarFocused
                ? Container()
                : FloatingCard(
                    color: Colors.transparent,
                    bottomPosition: 15.0,
                    leftPosition: 0.0,
                    rightPosition: 0.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (initPosition == defaultLocation)
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 16,
                                  color: Colors.orange[800],
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  AppLocaleKey.usingDefaultLocation.tr(),
                                  style: TextStyle(
                                    color: Colors.orange[800],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        Visibility(
                          visible: pickerState != SearchingState.Searching,
                          child: CustomConfirmLocationButtonWidget(
                            selectedPlace: selectedPlace,
                          ),
                        ),
                      ],
                    ),
                  );
          },
    );
  }
}
