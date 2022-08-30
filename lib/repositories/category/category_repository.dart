import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/category/category_model.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  CategoryRepository({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Stream<List<CategoryModel>> fetchCategories() {
    return firebaseFirestore.collection('categories').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    });
  }
}
