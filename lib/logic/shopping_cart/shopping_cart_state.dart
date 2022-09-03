part of 'shopping_cart_bloc.dart';

class ShoppingCartState {
  const ShoppingCartState({this.cartItems = const [], this.subtotal = 0});

  final List<ShoppingCartModel> cartItems;
  final double subtotal;

  ShoppingCartState copyWith({
    List<ShoppingCartModel>? cartItems,
    double? subtotal,
  }) {
    return ShoppingCartState(
      cartItems: cartItems ?? this.cartItems,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}
