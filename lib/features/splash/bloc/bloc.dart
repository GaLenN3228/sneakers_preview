import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';
part 'parts/init.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashInitialEvent>(_init);
  }
}
