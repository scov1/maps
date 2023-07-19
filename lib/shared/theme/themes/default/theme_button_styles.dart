import 'package:flutter/material.dart';

import '../_interface/i_button_styles.dart';
import '../_interface/i_text_styles.dart';
import 'theme_colors.dart';

class ThemeButtonStyles implements IButtonStyles {
  ThemeButtonStyles(this._color, this._style);

  @override
  late final ButtonStyle disabled = ElevatedButton.styleFrom(
    textStyle: _style.h16w700.copyWith(color: _color.grey700),
    foregroundColor: _color.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.grey300,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 32.0,
    ),
  );

  @override
  late final ButtonStyle elevated1 = ElevatedButton.styleFrom(
    textStyle: _style.h16w700,
    foregroundColor: _color.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.accent,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 32.0,
    ),
  );

  @override
  late final ButtonStyle elevated2 = ElevatedButton.styleFrom(
    foregroundColor: _color.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    backgroundColor: _color.accentBg,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 24.0,
    ),
  );

  @override
  late final ButtonStyle outline1 = OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: _color.textPrimary,
    elevation: 0.0,
    side: BorderSide(color: _color.textPrimary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 24.0,
    ),
    textStyle: _style.s16w600,
  );

  @override
  late final ButtonStyle text1 = ElevatedButton.styleFrom(
    foregroundColor: _color.accent,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    textStyle: _style.s16w600,
  );

  @override
  late final ButtonStyle text2 = ElevatedButton.styleFrom(
    foregroundColor: _color.textPrimary,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    textStyle: _style.s16w600,
  );

  @override
  late final ButtonStyle text3 = ElevatedButton.styleFrom(
    textStyle: _style.h16w700.copyWith(color: _color.accent),
    foregroundColor: _color.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.background,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 32.0,
    ),
  );

  @override
  late final ButtonStyle text4 = TextButton.styleFrom(
    textStyle: _style.h16w700,
    foregroundColor: _color.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    backgroundColor: _color.accentBg,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 32.0,
    ),
  );

  final ThemeColors _color;
  final ITextStyles _style;

  @override
  ThemeExtension<IButtonStyles> copyWith() {
    return this;
  }

  @override
  IButtonStyles lerp(ThemeExtension<IButtonStyles>? other, double t) {
    return this;
  }

  @override
  Object get type => IButtonStyles;
}
