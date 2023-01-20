part of '../bloc.dart';

extension Remove on CartBloc {
  Future<void> _remove(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState(data: state.data));
    final list = state.data.toList();

    list.removeWhere((element) => element.id == event.item.id);

    emit(CartDataState(data: list));
  }
}
