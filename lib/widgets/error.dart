import 'package:flutter/material.dart';

import '../shared/l10n/generated/l10n.dart';
import '../shared/theme/themes/_interface/app_theme.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.message,
    this.onRetry,
  });

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message ?? S.current.errorGeneral),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: context.button.elevated1,
                onPressed: () => onRetry?.call(),
                child: Text(
                  S.of(context).tryAgain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
