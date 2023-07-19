import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constants/app_assets.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.isActive,
    required this.label,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });

  final String activeIconPath;
  final String inactiveIconPath;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isActive ? context.color.grey100 : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                activeIconPath == AppAssets.images.gis
                    ? Image.asset(
                        AppAssets.images.gis,
                        height: 34,
                        width: 34,
                      )
                    : SvgPicture.asset(
                        isActive ? activeIconPath : inactiveIconPath,
                        height: 34,
                        width: 34,
                      ),
                const SizedBox(height: 10.0),
                Text(
                  label,
                  style: context.text.s10w500.copyWith(
                    color: isActive ? context.color.textPrimary : context.color.grey900,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
