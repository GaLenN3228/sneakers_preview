part of '../bloc.dart';

extension Init on SplashBloc {
  Future<void> _init(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashSuccessState());
  }
}
