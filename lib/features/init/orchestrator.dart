import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Orchestrator extends StatelessWidget {
  const Orchestrator({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      //init
      create: (context) {},
      child: builder(context),
    );
  }
}
