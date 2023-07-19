import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:flutter/material.dart';

class ButtonMapWidget extends StatelessWidget {
  final GisMapController controller;

  const ButtonMapWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: '1',
          child: const Icon(Icons.zoom_in_outlined),
          onPressed: () async {
            await controller.increaseZoom(duration: 200);
          },
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: '2',
          child: const Icon(Icons.zoom_out_outlined),
          onPressed: () async {
            await controller.reduceZoom(duration: 200);
          },
        ),
      ],
    );
  }
}
