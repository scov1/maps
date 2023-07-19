import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

part 'event.dart';
part 'state.dart';
part 'parts/get_google_map.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc() : super(InitialGoogleState()) {
    on<DataGoogleEvent>(_getGoogleMap);
  }

  LatLng? currentLatLng;
}
