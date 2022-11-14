import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/page_status.dart';
import '../../data/models/product/product_model.dart';
import '../../data/models/shopping_cart/shopping_cart_item_model.dart';
import '../../data/repositories/repositories.dart';

part 'shopping_cart_bloc.freezed.dart';
part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc({required this.shoppingCartRepostiory}) : super(const ShoppingCartState()) {
    on<_LoadShoppingCart>(_onShoppingCartLoaded);
    on<_AddProductToCart>(_onProductAddedToCart);
    on<_IncreaseProductQuantity>(_onProductCountIncreased);
    on<_DecreaseProductQuantity>(_onProductCountDecreased);
  }
  final BaseShoppingCartRepostiory shoppingCartRepostiory;

  Future<void> _onShoppingCartLoaded(_LoadShoppingCart event, Emitter<ShoppingCartState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));

    await emit.forEach<List<ShoppingCartItemModel>>(
      shoppingCartRepostiory.getUserCart(),
      onData: (cartItems) => state.copyWith(
        cartItems: cartItems,
        subtotal: shoppingCartRepostiory.calculateSubtotal(cartItems),
        status: PageStatus.success,
      ),
      onError: (_, __) => state.copyWith(status: PageStatus.failure),
    );
  }

  Future<void> _onProductAddedToCart(_AddProductToCart event, Emitter<ShoppingCartState> emit) async {
    // It is not needed to emit new state since we are listening the stream on _onShoppingCartLoaded method
    try {
      await shoppingCartRepostiory.addItemToCart(state.cartItems, event.product);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _onProductCountIncreased(_IncreaseProductQuantity event, Emitter<ShoppingCartState> emit) async {
    // It is not needed to emit new state since we are listening the stream on _onShoppingCartLoaded method
    try {
      await shoppingCartRepostiory.increaseQuantity(event.cartItem);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _onProductCountDecreased(_DecreaseProductQuantity event, Emitter<ShoppingCartState> emit) async {
    // It is not needed to emit new state since we are listening the stream on _onShoppingCartLoaded method
    try {
      await shoppingCartRepostiory.decreaseQuantity(event.cartItem);
    } catch (e) {
      log(e.toString());
    }
  }
}
