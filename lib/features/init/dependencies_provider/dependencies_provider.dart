import 'package:flutter/material.dart';
import 'package:sneakers_show/features/init/dependencies_provider/widgets/repos_provider.dart';

import 'widgets/blocs_provider.dart';

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return ReposProvider(
      child: BlocsProvider(
        child: Builder(builder: builder),
      ),
    );
  }
}
