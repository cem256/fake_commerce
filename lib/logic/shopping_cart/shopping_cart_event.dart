part of 'shopping_cart_bloc.dart';

@freezed
class ShoppingCartEvent with _$ShoppingCartEvent {
  const factory ShoppingCartEvent.productAddedToCart(ShoppingCartModel product) = ProductAddedToCart;
  const factory ShoppingCartEvent.productCountIncreased(ShoppingCartModel product) = ProductCountIncreased;
  const factory ShoppingCartEvent.productCountDecreased(ShoppingCartModel product) = ProductCountDecreased;
}
