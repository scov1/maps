import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/ui/gis_map/gis_map_screen.dart';
import '../home/ui/google_map/google_map_screen.dart';
import '../home/ui/osm/osm_screen.dart';
import '../shared/init/core_d_i.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../widgets/nav_bar/nav_bar.dart';
import 'controller/primary_tabs_controller.dart';
import 'controller/states.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  static const String name = 'RootScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryTabsController, PrimaryTabsState>(
      bloc: CoreDi.get<PrimaryTabsController>(),
      builder: (context, state) {
        final controller = CoreDi.get<PrimaryTabsController>();
        final currentIndex = state.index;
        return SafeArea(
          child: Scaffold(
            body: IndexedStack(
              key: UniqueKey(),
              index: currentIndex,
              children: <Widget>[
                Navigator(
                  key: controller.navigatorKeys[0],
                  onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                    const GoogleMapScreen(),
                  ),
                ),
                Navigator(
                  key: controller.navigatorKeys[1],
                  onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                    const OsmScreen(),
                  ),
                ),
                Navigator(
                  key: controller.navigatorKeys[2],
                  onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                    const GisMapScreen(),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: NavBar(
              current: currentIndex,
              switchTo: controller.switchToTab,
            ),
          ),
        );
      },
    );
  }
}
