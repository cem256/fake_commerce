part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class ProductAddedToCart extends ShoppingCartEvent {
  final ShoppingCartModel product;

  const ProductAddedToCart(this.product);

  @override
  List<Object> get props => [product];
}

class ProductCountIncreased extends ShoppingCartEvent {
  final ShoppingCartModel product;

  const ProductCountIncreased(this.product);

  @override
  List<Object> get props => [product];
}

class ProductCountDecreased extends ShoppingCartEvent {
  final ShoppingCartModel product;

  const ProductCountDecreased(this.product);

  @override
  List<Object> get props => [product];
}
