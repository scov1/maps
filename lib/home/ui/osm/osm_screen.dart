import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/l10n/generated/l10n.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../widgets/error.dart';
import 'bloc/bloc.dart';

class OsmScreen extends StatefulWidget {
  const OsmScreen({Key? key}) : super(key: key);

  @override
  State<OsmScreen> createState() => _OsmScreenState();
}

class _OsmScreenState extends State<OsmScreen> {
  final controller = MapController(
    initMapWithUserPosition: const UserTrackingOption(
      enableTracking: true,
      unFollowUser: true,
    ),
  );

  @override
  void initState() {
    CoreDi.get<OsmBloc>().add(DataOsmEvent());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OsmBloc, OsmState>(
        bloc: CoreDi.get<OsmBloc>(),
        builder: (context, state) {
          if (state is ErrorOsmState) {
            return AppErrorWidget(
              message: state.error,
              onRetry: () {
                CoreDi.get<OsmBloc>().add(DataOsmEvent());
              },
            );
          }
          if (state is LoadingOsmState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is DataOsmState) {
            if (state.currentLatLng == null) {
              return AppErrorWidget(
                message: S.of(context).errorLocation,
                onRetry: () {
                  CoreDi.get<OsmBloc>().add(DataOsmEvent());
                },
              );
            } else {
              return OSMFlutter(
                controller: controller,
                androidHotReloadSupport: true,
                onLocationChanged: (GeoPoint point) {},
                onMapIsReady: (bool value) async {
                  if (value) {
                    Future.delayed(const Duration(seconds: 1), () async {
                      await controller.currentLocation();
                    });
                  }
                },
                markerOption: MarkerOption(
                  defaultMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
                showZoomController: true,
                initZoom: 14,
                minZoomLevel: 4,
                maxZoomLevel: 19,
                stepZoom: 1.0,
                roadConfiguration: RoadOption(
                  roadColor: context.color.error,
                ),
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
