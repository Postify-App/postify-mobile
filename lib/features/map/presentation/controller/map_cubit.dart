import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postify/core/locale/app_locale_key.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState.initial());

  Future<void> determinePosition({LatLng? initialLatLng}) async {
    if (initialLatLng != null) {
      emit(
        state.copyWith(
          initPosition: initialLatLng,
          isLoading: false,
          errorMessage: null,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: AppLocaleKey.locationServiceDisabled.tr(),
          ),
        );
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: AppLocaleKey.locationPermissionDenied.tr(),
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: AppLocaleKey.locationPermissionDeniedForever.tr(),
          ),
        );
        return;
      }

      if (permission == LocationPermission.unableToDetermine) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: AppLocaleKey.locationPermissionUnableToDetermine.tr(),
          ),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      emit(
        state.copyWith(
          initPosition: LatLng(position.latitude, position.longitude),
          isLoading: false,
          errorMessage: null,
        ),
      );
    } on LocationServiceDisabledException {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: AppLocaleKey.locationServiceDisabledException.tr(),
        ),
      );
    } on PermissionDeniedException {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: AppLocaleKey.locationPermissionDeniedException.tr(),
        ),
      );
    } on PositionUpdateException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: AppLocaleKey.locationPositionUpdateError.tr(
            namedArgs: {"error": e.message ?? ""},
          ),
        ),
      );
    }
  }

  Future<void> retryLocation() async {
    await determinePosition();
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> getPermissionStatus() async {
    return await Geolocator.checkPermission();
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  void setCustomPosition(LatLng position) {
    emit(
      state.copyWith(
        initPosition: position,
        isLoading: false,
        errorMessage: null,
      ),
    );
  }
}
