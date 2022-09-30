import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product/product_model.dart';
import 'base_product_repository.dart';

class ProductRepository implements BaseProductRepository {
  ProductRepository({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Stream<List<ProductModel>> fetchProducts() {
    return firebaseFirestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    });
  }
}
