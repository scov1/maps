import 'dart:typed_data';

import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../shared/l10n/generated/l10n.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../shared/constants/app_assets.dart';

part 'event.dart';
part 'state.dart';
part 'parts/get_gis_map.dart';

class GisBloc extends Bloc<GisEvent, GisState> {
  GisBloc() : super(InitialGisState()) {
    on<DataGisEvent>(_getGoogleMap);
  }

  LatLng? currentLatLng;

  late final Future<List<GisMapMarker>> icons;

  final GisMapController controller = GisMapController();

  Future<Uint8List> getImage(
    String path,
  ) async {
    ByteData data = await rootBundle.load(path);

    return data.buffer.asUint8List();
  }

  Future<void> setMarkers() async {
    final markers = await icons;
    controller.updateMarkers(markers);
  }
}
