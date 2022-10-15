import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product/product_model.dart';
import 'base_product_repository.dart';

class ProductRepository implements BaseProductRepository {
  ProductRepository({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final querySnapshot = await firebaseFirestore.collection('products').get();
    return querySnapshot.docs.map((e) => e.data()).map((e) => ProductModel.fromJson(e)).toList();
  }
}
