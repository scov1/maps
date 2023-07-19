part of '../bloc.dart';

extension Osm on OsmBloc {
  Future<void> _getOsmMap(DataOsmEvent event, Emitter<OsmState> emit) async {
    try {
      emit(LoadingOsmState());

      await Geolocator.getCurrentPosition().then((value) {
        currentLatLng = LatLng(value.latitude, value.longitude);
      });

      emit(DataOsmState(currentLatLng: currentLatLng));
    } catch (e) {
      emit(ErrorOsmState(error: e.toString()));
    }
  }
}
