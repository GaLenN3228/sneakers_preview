import 'package:flutter/material.dart';

import '../interfaces/i_colors.dart';

class ThemeColors implements IColors {
  const ThemeColors({
    this.background = const Color(0xFFFFFFFF),
    this.buttonShadow1 = const Color(0x66CB8665),
    this.dark = const Color(0xFF212429),
    this.error = const Color(0xFFED5A3A),
    this.errorBg = const Color(0xFFFDEBE7),
    this.success = const Color(0xFF49B66E),
    this.successBg = const Color(0xFFE8F7EB),
    this.successShade = const Color(0xFFE8F6EB),
    this.grey900 = const Color(0xFF6B7280),
    this.grey700 = const Color(0xFFAFAFAF),
    this.grey300 = const Color(0xFFD8DADD),
    this.grey100 = const Color(0xFFF4F4F5),
    this.link = const Color(0xFF3E66CE),
    this.primary = const Color(0xFFc43050),
    this.blackShadow = const Color(0xff000000),
    this.primaryBg = const Color.fromRGBO(255, 140, 28, 0.12),
    this.outlinedBorder = const Color(0xFF1877F2),
  });

  @override
  final Color background;

  @override
  final Color buttonShadow1;

  @override
  final Color dark;

  @override
  final Color error;

  @override
  final Color errorBg;

  @override
  final Color grey100;

  @override
  final Color grey300;

  @override
  final Color grey700;

  @override
  final Color grey900;

  @override
  final Color link;

  @override
  final Color outlinedBorder;

  @override
  final Color primary;

  @override
  final Color primaryBg;

  @override
  final Color success;

  @override
  final Color successBg;
  @override
  final Color successShade;

  @override
  final Color blackShadow;

  @override
  ThemeColors copyWith({
    Color? background,
    Color? buttonShadow1,
    Color? dark,
    Color? error,
    Color? link,
    Color? grey900,
    Color? grey700,
    Color? grey300,
    Color? grey100,
    Color? primary,
    Color? primaryBg,
    Color? success,
    Color? successBg,
    Color? errorBg,
    Color? blackShadow,
  }) {
    return ThemeColors(
      background: background ?? this.background,
      buttonShadow1: buttonShadow1 ?? this.buttonShadow1,
      dark: dark ?? this.dark,
      link: link ?? this.link,
      primary: primary ?? this.primary,
      primaryBg: primaryBg ?? this.primaryBg,
      success: success ?? this.success,
      successBg: successBg ?? this.successBg,
      error: error ?? this.error,
      errorBg: errorBg ?? this.errorBg,
      grey900: grey900 ?? this.grey900,
      grey700: grey700 ?? this.grey700,
      grey300: grey300 ?? this.grey300,
      grey100: grey100 ?? this.grey100,
      blackShadow: blackShadow ?? this.blackShadow,
    );
  }

  @override
  IColors lerp(ThemeExtension<IColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      blackShadow: Color.lerp(blackShadow, other.blackShadow, t)!,
      background: Color.lerp(background, other.background, t)!,
      buttonShadow1: Color.lerp(buttonShadow1, other.buttonShadow1, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorBg: Color.lerp(errorBg, other.errorBg, t)!,
      link: Color.lerp(link, other.link, t)!,
      grey900: Color.lerp(grey900, other.grey900, t)!,
      grey700: Color.lerp(grey700, other.grey900, t)!,
      grey300: Color.lerp(grey300, other.grey900, t)!,
      grey100: Color.lerp(grey100, other.grey900, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryBg: Color.lerp(primaryBg, other.primaryBg, t)!,
      success: Color.lerp(success, other.success, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
    );
  }

  @override
  Object get type => IColors;
}
