import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneakers_show/widgets/theme/impl/default_theme.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

import 'i_theme_repo.dart';

export 'i_theme_repo.dart';

class ThemeRepo implements IThemeRepo {
  @override
  final availableThemes = [
    DefaultTheme(),
  ];

  @override
  ValueNotifier<AppTheme> theme = ValueNotifier<AppTheme>(DefaultTheme());

  @override
  void apply(String? themeId) {
    final theme = _themeFromID(themeId);
    if (theme == null) return;
    this.theme.value = theme;
    SystemChrome.setSystemUIOverlayStyle(
      theme.data.appBarTheme.systemOverlayStyle!,
    );
  }

  AppTheme? _themeFromID(String? themeID) {
    if (themeID == null) return null;
    return availableThemes.firstWhereOrNull(
      (theme) => theme.id == themeID,
    );
  }
}
