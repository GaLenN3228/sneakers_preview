part of '../bloc.dart';

extension AddToCard on CartBloc {
  Future<void> _addToCart(
    AddToCardEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state.data.isEmpty) {
      emit(CartLoadingState(data: state.data));
      final items = state.data.toList();
      items.add(event.item);
      emit(CartDataState(data: items));
    } else {
      final existedItem = state.data.firstWhereOrNull((element) => element.id == event.item.id);
      if (existedItem != null) {
        final index = state.data.indexWhere((element) => element.id == event.item.id);
        final list = state.data.toList();
        list[index] = existedItem.copyWith(
          count: existedItem.count! + 1,
        );
        emit(CartDataState(data: list));
      }
    }
  }
}
