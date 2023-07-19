import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../shared/l10n/generated/l10n.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../widgets/error.dart';
import 'bloc/bloc.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final _controller = Completer();
  @override
  void initState() {
    CoreDi.get<GoogleBloc>().add(DataGoogleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GoogleBloc, GoogleState>(
        bloc: CoreDi.get<GoogleBloc>(),
        builder: (context, state) {
          if (state is ErrorGoogleState) {
            return AppErrorWidget(
              message: state.error,
              onRetry: () {
                CoreDi.get<GoogleBloc>().add(DataGoogleEvent());
              },
            );
          }
          if (state is LoadingGoogleState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is DataGoogleState) {
            if (state.currentLatLng == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).errorLocation,
                    style: context.text.s16w500,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).tryAgain,
                      ))
                ],
              );
            } else {
              return SafeArea(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: state.currentLatLng!,
                    zoom: 14,
                  ),
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId("1"),
                      position: state.currentLatLng!,
                      infoWindow: InfoWindow(
                        title: S.of(context).currentLocation,
                      ),
                    ),
                  },
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
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
