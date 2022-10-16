part of 'shopping_cart_bloc.dart';

@freezed
class ShoppingCartEvent with _$ShoppingCartEvent {
  const factory ShoppingCartEvent.loadShoppingCart() = LoadShoppingCart;
  const factory ShoppingCartEvent.addProductToCart(ProductModel product) = AddProductToCart;
  const factory ShoppingCartEvent.increaseProductQuantity(ShoppingCartItemModel cartItem) = IncreaseProductQuantity;
  const factory ShoppingCartEvent.decreaseProductQuantity(ShoppingCartItemModel cartItem) = DecreaseProductQuantity;
}
