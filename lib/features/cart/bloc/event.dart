part of 'bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddToCardEvent extends CartEvent with EquatableMixin {
  AddToCardEvent({
    required this.item,
  });

  final CartItem item;

  @override
  List<Object> get props => [item];
}

class CartInitialEvent extends CartEvent {}

class DecrementCartItem extends CartEvent {
  DecrementCartItem({
    required this.item,
  });

  final CartItem item;
}

class IncrementCarItem extends CartEvent {
  IncrementCarItem({
    required this.item,
  });

  final CartItem item;
}

class RemoveFromCart extends CartEvent {
  RemoveFromCart({
    required this.item,
  });

  final CartItem item;
}
