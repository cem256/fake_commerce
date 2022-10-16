part of 'shopping_cart_bloc.dart';

@freezed
class ShoppingCartState with _$ShoppingCartState {
  const factory ShoppingCartState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<ShoppingCartItemModel> cartItems,
    @Default(0) double subtotal,
  }) = _ShoppingCartState;
}
