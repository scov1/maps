import 'package:flutter/material.dart';

import '../_interface/i_colors.dart';
import '../_interface/i_text_styles.dart';

class ThemeTextStyles implements ITextStyles {
  ThemeTextStyles(this._colors);

  @override
  late final b16w600 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w600,
  );

  @override
  late final TextStyle error = TextStyle(
    fontSize: 14,
    color: _colors.error,
    fontFamily: 'Inter',
  );

  @override
  late final h16w700 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat Alternates',
    fontWeight: FontWeight.w700,
  );

  @override
  late final h20w700 = TextStyle(
    fontSize: 20,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat Alternates',
    fontWeight: FontWeight.w700,
  );

  @override
  late final h24w700 = TextStyle(
    fontSize: 24,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat Alternates',
    fontWeight: FontWeight.w700,
  );

  @override
  late final s10w500 = TextStyle(
    fontSize: 10,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  @override
  late final s12w400 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  @override
  late final s12w500 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  @override
  late final s12w700 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s14w400 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  @override
  late final s14w500 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  @override
  late final s14w700 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s16w400 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  @override
  late final s16w500 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  @override
  late final s16w600 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  @override
  late final s16w700 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s20w700 = TextStyle(
    fontSize: 20,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s24w700 = TextStyle(
    fontSize: 24,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  @override
  late final s36w400 = TextStyle(
    fontSize: 36,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  late final IColors _colors;

  @override
  ITextStyles copyWith() {
    return this;
  }

  @override
  ITextStyles lerp(ThemeExtension<ITextStyles>? other, double t) {
    return this;
  }

  @override
  Object get type => ITextStyles;
}
