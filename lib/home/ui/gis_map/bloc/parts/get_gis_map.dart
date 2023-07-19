part of '../bloc.dart';

extension Google on GisBloc {
  Future<void> _getGoogleMap(DataGisEvent event, Emitter<GisState> emit) async {
    try {
      emit(LoadingGisState());
      await Geolocator.getCurrentPosition().then((value) {
        currentLatLng = LatLng(value.latitude, value.longitude);
      });

      icons = getImage(AppAssets.images.marker).then((value) {
        return [GisMapMarker(icon: value, latitude: 51.1655117, longitude: 71.4272217, zIndex: 0, id: "123456")];
      });
      await setMarkers();
      if (currentLatLng?.latitude == null || currentLatLng?.longitude == null) {
        emit(ErrorGisState(error: S.current.errorLocation));
      } else {
        emit(DataGisState(currentLatLng: currentLatLng));
      }
    } catch (e) {
      emit(ErrorGisState(error: e.toString()));
    }
  }
}
