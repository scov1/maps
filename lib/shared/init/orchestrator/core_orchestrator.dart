import 'package:flutter/widgets.dart';

import 'listeners/root_gateway_listener.dart';

class CoreOrchestrator extends StatefulWidget {
  const CoreOrchestrator({super.key, required this.builder});

  final Widget Function(BuildContext) builder;

  @override
  State<CoreOrchestrator> createState() => _CoreOrchestratorState();
}

class _CoreOrchestratorState extends State<CoreOrchestrator> {
  @override
  Widget build(BuildContext context) {
    return RootGatewayListener(
      child: Builder(
        builder: widget.builder,
      ),
    );
  }
}
