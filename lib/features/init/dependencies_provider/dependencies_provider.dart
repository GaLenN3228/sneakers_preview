import 'package:flutter/material.dart';

import 'widgets/blocs_provider.dart';

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return BlocsProvider(
      child: Builder(builder: builder),
    );
  }
}
