part of '../bloc.dart';

extension Initial on CartBloc {
  Future<void> _init(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState(data: state.data));

    emit(CartDataState(data: state.data));
  }
}
