import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/extensions/firebase_user_extensions.dart';
import '../../models/product/product_model.dart';
import '../../models/user/user_model.dart';
import 'base_shopping_cart_repository.dart';

class ShoppingCartRepository implements BaseShoppingCartRepostiory {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  ShoppingCartRepository({required this.firebaseAuth, required this.firebaseFirestore});

  @override
  UserModel get currentUser => firebaseAuth.currentUser.toUserModel;

  @override
  void createUserCart() {
    firebaseFirestore.collection('userCart').doc(currentUser.uid).collection('items');
  }

  @override
  Future<void> addItemToCart(ProductModel product) async {
    await firebaseFirestore
        .collection('userCart')
        .doc(currentUser.uid)
        .collection('items')
        .doc(product.name)
        .set(product.toJson());
  }

  @override
  Future<void> removeItemFromCart(ProductModel product) async {
    firebaseFirestore.collection('userCart').doc(currentUser.uid).collection('items').doc(product.name).delete();
  }
}
