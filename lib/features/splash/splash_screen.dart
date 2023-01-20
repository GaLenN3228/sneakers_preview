import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_show/features/splash/bloc/bloc.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(SplashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state is SplashSuccessState) {
            await Future.delayed(const Duration(seconds: 2));
            context.router.replaceAll([
              const PrimaryScreenRoute(),
            ]);
          }
        },
        builder: (context, state) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
