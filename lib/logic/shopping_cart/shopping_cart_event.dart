part of 'shopping_cart_bloc.dart';

@freezed
class ShoppingCartEvent with _$ShoppingCartEvent {
  const factory ShoppingCartEvent.loadShoppingCart() = _LoadShoppingCart;
  const factory ShoppingCartEvent.addProductToCart(ProductModel product) = _AddProductToCart;
  const factory ShoppingCartEvent.increaseProductQuantity(ShoppingCartItemModel cartItem) = _IncreaseProductQuantity;
  const factory ShoppingCartEvent.decreaseProductQuantity(ShoppingCartItemModel cartItem) = _DecreaseProductQuantity;
}
