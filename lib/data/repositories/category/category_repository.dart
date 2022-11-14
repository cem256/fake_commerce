import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/category/category_model.dart';
import 'base_category_repository.dart';

class CategoryRepository implements BaseCategoryRepository {
  CategoryRepository({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final querySnapshot = await firebaseFirestore.collection('categories').get();
    return querySnapshot.docs.map((e) => e.data()).map(CategoryModel.fromJson).toList();
  }
}
