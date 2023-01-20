import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_show/localization/locale_repo.dart';
import 'package:sneakers_show/widgets/theme/repo/theme_repo.dart';

class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IThemeRepo>(
          create: (context) => ThemeRepo(),
        ),
        RepositoryProvider<ILocaleRepo>(
          create: (context) => LocaleRepo(),
        ),
      ],
      child: child,
    );
  }
}
