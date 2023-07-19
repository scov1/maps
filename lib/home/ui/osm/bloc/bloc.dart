import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'event.dart';
part 'state.dart';
part 'parts/get_osm.dart';

class OsmBloc extends Bloc<OsmEvent, OsmState> {
  OsmBloc() : super(InitialOsmState()) {
    on<DataOsmEvent>(_getOsmMap);
  }

  LatLng? currentLatLng;
}
