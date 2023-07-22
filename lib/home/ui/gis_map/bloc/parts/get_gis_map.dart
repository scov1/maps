part of '../bloc.dart';

extension Google on GisBloc {
  Future<void> _getGoogleMap(DataGisEvent event, Emitter<GisState> emit) async {
    try {
      emit(LoadingGisState());
      await Geolocator.getCurrentPosition().then((value) {
        currentLatLng = LatLng(value.latitude, value.longitude);
      });
      if (currentLatLng?.latitude == null || currentLatLng?.longitude == null) {
        emit(ErrorGisState(error: S.current.errorLocation));
      } else {
        icons = getImage(AppAssets.images.marker).then((value) {
          return [
            GisMapMarker(
              icon: value,
              latitude: currentLatLng!.latitude,
              longitude: currentLatLng!.longitude,
              zIndex: 0,
              id: "123456",
            )
          ];
        });

        await setMarkers();
        emit(DataGisState(currentLatLng: currentLatLng));
      }
    } catch (e) {
      emit(ErrorGisState(error: e.toString()));
    }
  }
}
