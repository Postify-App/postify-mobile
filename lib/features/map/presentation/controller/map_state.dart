part of 'map_cubit.dart';

class MapState extends Equatable {
  final LatLng initPosition;
  final bool isLoading;
  final String? errorMessage;

  const MapState({
    required this.initPosition,
    this.isLoading = false,
    this.errorMessage,
  });

  factory MapState.initial() =>
      const MapState(initPosition: LatLng(0, 0), isLoading: true);

  MapState copyWith({
    LatLng? initPosition,
    bool? isLoading,
    String? errorMessage,
  }) {
    return MapState(
      initPosition: initPosition ?? this.initPosition,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [initPosition, isLoading, errorMessage];
}
