import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

import 'theme_button_styles.dart';
import 'theme_colors.dart';
import 'theme_text_styles.dart';

class DefaultTheme implements AppTheme {
  @override
  late final data = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'JosefinSans',
    useMaterial3: false,
    primaryColor: _color.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _color.primary,
    ),
    errorColor: _color.error,
    hintColor: _color.grey700,
    canvasColor: _color.background,
    textButtonTheme: TextButtonThemeData(
      style: _button.text1,
    ),
    textTheme: TextTheme(
      bodyText1: _text.s14w500,
      bodyText2: _text.s14w500,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: _color.primary,
      linearMinHeight: 2.0,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: _color.background,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    extensions: <ThemeExtension>[
      _color,
      _text,
      _button,
    ],
  );

  late final _button = ThemeButtonStyles(_color, _text);
  final _color = const ThemeColors();
  late final _text = ThemeTextStyles(_color);

  @override
  String get id => runtimeType.toString();

  @override
  String get name => 'Default';
}
