part of 'bloc.dart';

abstract class CartState {
  const CartState({
    required this.data,
  });

  final List<CartItem> data;
}

class CartInitialState extends CartState {
  CartInitialState({required super.data});
}

class CartLoadingState extends CartState {
  CartLoadingState({required super.data});
}

class CartErrorState extends CartState {
  CartErrorState({required super.data});
}

class CartDataState extends CartState {
  CartDataState({required super.data});
}
