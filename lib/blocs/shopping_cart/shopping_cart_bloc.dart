import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/shopping_cart/shopping_cart_model.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState()) {
    on<ProductAddedToCart>(_onProductAddedToCart);

    on<ProductCountIncreased>(_onProductCountIncreased);
    on<ProductCountDecreased>(_onProductCountDecreased);
  }

  void _onProductAddedToCart(ProductAddedToCart event, Emitter<ShoppingCartState> emit) {
    if (state.cartItems.contains(event.product)) {
      List<ShoppingCartModel> cartItems = List.of(state.cartItems)..remove(event.product);
      emit(state.copyWith(cartItems: cartItems, subtotal: _calculateSubtotal(cartItems)));
    } else {
      List<ShoppingCartModel> cartItems = List.of(state.cartItems)..add(event.product);
      emit(state.copyWith(cartItems: cartItems, subtotal: _calculateSubtotal(cartItems)));
    }
  }

  void _onProductCountIncreased(ProductCountIncreased event, Emitter<ShoppingCartState> emit) {
    List<ShoppingCartModel> cartItems = state.cartItems;
    int itemIndex = state.cartItems.indexOf(event.product);
    ++cartItems[itemIndex].count;

    emit(state.copyWith(cartItems: cartItems, subtotal: _calculateSubtotal(cartItems)));
  }

  void _onProductCountDecreased(ProductCountDecreased event, Emitter<ShoppingCartState> emit) {
    List<ShoppingCartModel> cartItems = state.cartItems;
    int itemIndex = state.cartItems.indexOf(event.product);
    if (cartItems[itemIndex].count != 1) {
      --cartItems[itemIndex].count;
    } else {
      cartItems.removeAt(itemIndex);
    }
    emit(state.copyWith(cartItems: cartItems, subtotal: _calculateSubtotal(cartItems)));
  }

  double _calculateSubtotal(List<ShoppingCartModel> userCart) {
    double subTotal = 0;
    for (var element in userCart) {
      subTotal += element.product.price * element.count;
    }
    return subTotal;
  }
}
