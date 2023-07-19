part of '../bloc.dart';

extension Google on GoogleBloc {
  Future<void> _getGoogleMap(DataGoogleEvent event, Emitter<GoogleState> emit) async {
    try {
      emit(LoadingGoogleState());
      await Permission.location.request();

      await Geolocator.getCurrentPosition().then((value) {
        currentLatLng = LatLng(value.latitude, value.longitude);
      });

      emit(DataGoogleState(currentLatLng: currentLatLng));
    } catch (e) {
      emit(ErrorGoogleState(error: e.toString()));
    }
  }
}
