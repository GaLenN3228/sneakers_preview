import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_show/features/init/dependencies_provider/dependencies_provider.dart';
import 'package:sneakers_show/features/init/orchestrator.dart';
import 'package:sneakers_show/localization/i_locale_repo.dart';
import 'package:sneakers_show/widgets/app_log.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';
import 'package:sneakers_show/widgets/sc_unfocuser.dart';
import 'package:sneakers_show/widgets/theme/impl/default_theme.dart';
import 'package:sneakers_show/widgets/theme/repo/i_theme_repo.dart';
import 'localization/generated/l10n.dart';
import 'widgets/theme/interfaces/app_theme.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  runZonedGuarded(
    () {
      final defaultTheme = DefaultTheme();
      SystemChrome.setSystemUIOverlayStyle(
        defaultTheme.data.appBarTheme.systemOverlayStyle!,
      );
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      return runApp(
        DependenciesProvider(
          builder: (context) {
            return InheritedProvider<AppRouter>(
              create: (context) => AppRouter(
                navigatorKey: GlobalKey<NavigatorState>(),
              ),
              child: Orchestrator(
                builder: (context) {
                  return ValueListenableBuilder<AppTheme>(
                    valueListenable: context.read<IThemeRepo>().theme,
                    builder: (context, theme, _) {
                      return ValueListenableBuilder<Locale>(
                        valueListenable: context.read<ILocaleRepo>().locale,
                        builder: (context, locale, _) {
                          return AppUnfocuser(
                            child: MaterialApp.router(
                              routerDelegate: context.read<AppRouter>().delegate(),
                              routeInformationParser: context.read<AppRouter>().defaultRouteParser(),
                              scaffoldMessengerKey: scaffoldMessengerKey,
                              debugShowCheckedModeBanner: false,
                              localizationsDelegates: const [
                                S.delegate,
                                GlobalMaterialLocalizations.delegate,
                                GlobalWidgetsLocalizations.delegate,
                                GlobalCupertinoLocalizations.delegate,
                              ],
                              locale: locale,
                              supportedLocales: S.delegate.supportedLocales,
                              title: 'SneakersShow',
                              theme: theme.data,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      );
    },
    (error, stack) {
      AppLog.log(error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
