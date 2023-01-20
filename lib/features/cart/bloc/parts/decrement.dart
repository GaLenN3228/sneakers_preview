part of '../bloc.dart';

extension Decrement on CartBloc {
  Future<void> _decrement(
    DecrementCartItem event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState(data: state.data));
    final list = state.data.toList();

    final index = state.data.indexWhere((element) => element.id == event.item.id);

    list[index] = event.item.copyWith(
      count: event.item.count! - 1,
    );

    emit(CartDataState(data: list));
  }
}
