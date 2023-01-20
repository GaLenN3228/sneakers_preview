import 'package:flutter/material.dart';
import 'package:sneakers_show/features/home/widgets/app_bar_icons.dart';
import 'package:sneakers_show/features/home/widgets/tabs/nike_tab.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.color.background,
          title: Text(
            S.of(context).discover,
            style: context.text.s24w700,
          ),
          actions: const [AppBarIcons()],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                unselectedLabelColor: context.color.grey700,
                unselectedLabelStyle: context.text.s16w600.copyWith(
                  color: context.color.primary,
                ),
                labelStyle: context.text.s16w600.copyWith(
                  color: context.color.primary,
                ),
                labelColor: context.color.dark,
                splashBorderRadius: BorderRadius.circular(12),
                indicator: const BoxDecoration(),
                tabs: [
                  Text(S.of(context).nike),
                  Text(S.of(context).addidas),
                  Text(S.of(context).jordan),
                  Text(S.of(context).puma),
                  Text(S.of(context).reebok),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const NikeTab(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
