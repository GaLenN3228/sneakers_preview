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
