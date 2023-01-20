import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_show/features/cart/bloc/bloc.dart';
import 'package:sneakers_show/features/splash/bloc/bloc.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(CartInitialEvent()),
        ),
      ],
      child: child,
    );
  }
}
