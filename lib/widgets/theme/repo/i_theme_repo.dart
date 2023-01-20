import 'package:flutter/material.dart';
import 'package:sneakers_show/widgets/theme/impl/default_theme.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

abstract class IThemeRepo {
  List<DefaultTheme> get availableThemes;

  abstract ValueNotifier<AppTheme> theme;

  void apply(String? themeID);
}
