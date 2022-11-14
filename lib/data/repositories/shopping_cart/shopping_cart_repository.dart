import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/extensions/firebase_user_extensions.dart';
import '../../models/product/product_model.dart';
import '../../models/shopping_cart/shopping_cart_item_model.dart';
import '../../models/user/user_model.dart';
import 'base_shopping_cart_repository.dart';

class ShoppingCartRepository implements BaseShoppingCartRepostiory {
  ShoppingCartRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  @override
  UserModel get currentUser => firebaseAuth.currentUser.toUserModel;

  @override
  Stream<List<ShoppingCartItemModel>> getUserCart() {
    return firebaseFirestore
        .collection('userCart')
        .doc(currentUser.uid)
        .collection('cartItems')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ShoppingCartItemModel.fromJson(doc.data())).toList();
    });
  }

  @override
  Future<void> addItemToCart(
    List<ShoppingCartItemModel> cartItems,
    ProductModel product,
  ) async {
    if (_isItemAlreadyAdded(cartItems, product)) {
      await firebaseFirestore
          .collection('userCart')
          .doc(currentUser.uid)
          .collection('cartItems')
          .doc(product.name)
          .delete();
    } else {
      await firebaseFirestore
          .collection('userCart')
          .doc(currentUser.uid)
          .collection('cartItems')
          .doc(product.name)
          .set(ShoppingCartItemModel(product: product).toJson());
    }
  }

  @override
  Future<void> decreaseQuantity(ShoppingCartItemModel cartItem) async {
    if (cartItem.quantity == 1) {
      await firebaseFirestore
          .collection('userCart')
          .doc(currentUser.uid)
          .collection('cartItems')
          .doc(cartItem.product.name)
          .delete();
    } else {
      await firebaseFirestore
          .collection('userCart')
          .doc(currentUser.uid)
          .collection('cartItems')
          .doc(cartItem.product.name)
          .update(cartItem.copyWith(quantity: cartItem.quantity - 1).toJson());
    }
  }

  @override
  Future<void> increaseQuantity(ShoppingCartItemModel cartItem) async {
    await firebaseFirestore
        .collection('userCart')
        .doc(currentUser.uid)
        .collection('cartItems')
        .doc(cartItem.product.name)
        .update(cartItem.copyWith(quantity: cartItem.quantity + 1).toJson());
  }

  @override
  double calculateSubtotal(List<ShoppingCartItemModel> userCart) {
    // ignore: omit_local_variable_types
    double subTotal = 0;

    for (final element in userCart) {
      subTotal += element.product.price * element.quantity;
    }

    return subTotal;
  }

  bool _isItemAlreadyAdded(
    List<ShoppingCartItemModel> cartItems,
    ProductModel product,
  ) {
    return cartItems.map((e) => e.product.name).contains(product.name);
  }
}
