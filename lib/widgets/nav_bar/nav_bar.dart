import 'package:flutter/material.dart';

import '../../shared/constants/app_assets.dart';
import '../../shared/l10n/generated/l10n.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import 'nav_bar_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.current,
    required this.switchTo,
  });

  final void Function(int) switchTo;
  final int current;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 8,
      currentIndex: current,
      onTap: (index) async {
        switchTo(index);
      },
      selectedItemColor: context.color.shadow,
      unselectedItemColor: context.color.grey300,
      backgroundColor: context.color.background,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: true,
      selectedFontSize: 4,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: S.of(context).google,
          icon: NavBarItem(
            isActive: current == 0,
            activeIconPath: AppAssets.svg.google,
            inactiveIconPath: AppAssets.svg.google,
            label: S.of(context).google,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            isActive: current == 1,
            activeIconPath: AppAssets.svg.osm,
            inactiveIconPath: AppAssets.svg.osm,
            label: S.of(context).osm,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            isActive: current == 2,
            activeIconPath: AppAssets.images.gis,
            inactiveIconPath: AppAssets.images.gis,
            label: S.of(context).gis,
          ),
        ),
      ],
    );
  }
}
