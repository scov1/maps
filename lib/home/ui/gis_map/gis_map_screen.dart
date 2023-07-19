import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/init/core_d_i.dart';
import '../../../widgets/error.dart';
import 'bloc/bloc.dart';
import 'widgets/button_map_widget.dart';

class GisMapScreen extends StatefulWidget {
  const GisMapScreen({Key? key}) : super(key: key);

  @override
  State<GisMapScreen> createState() => _GisMapScreenState();
}

class _GisMapScreenState extends State<GisMapScreen> {
  @override
  void initState() {
    CoreDi.get<GisBloc>().add(DataGisEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GisBloc, GisState>(
        bloc: CoreDi.get<GisBloc>(),
        builder: (context, state) {
          if (state is ErrorGisState) {
            return AppErrorWidget(
              message: state.error,
              onRetry: () {
                CoreDi.get<GisBloc>().add(DataGisEvent());
              },
            );
          }
          if (state is LoadingGisState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is DataGisState) {
            return GisMap(
              directoryKey: 'rubyqf9316',
              mapKey: 'b7272230-6bc3-47e9-b24b-0eba73b12fe1',
              useHybridComposition: true,
              controller: CoreDi.get<GisBloc>().controller,
              onTapMarker: (marker) {},
              startCameraPosition: GisCameraPosition(
                latitude: state.currentLatLng!.latitude,
                longitude: state.currentLatLng!.longitude,
                bearing: 85.0,
                tilt: 25.0,
                zoom: 14.0,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: ButtonMapWidget(
        controller: CoreDi.get<GisBloc>().controller,
      ),
    );
  }
}
