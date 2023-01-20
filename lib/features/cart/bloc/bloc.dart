import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_show/features/cart/models/cart_item.dart';

part 'event.dart';
part 'state.dart';
part 'parts/add_to_cart.dart';
part 'parts/init.dart';
part 'parts/decrement.dart';
part 'parts/increment.dart';
part 'parts/remove.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState(data: [])) {
    on<AddToCardEvent>(_addToCart);
    on<CartInitialEvent>(_init);
    on<DecrementCartItem>(_decrement);
    on<IncrementCarItem>(_increment);
    on<RemoveFromCart>(_remove);
  }
}
