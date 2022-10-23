import '../../models/category/category_model.dart';

abstract class BaseCategoryRepository {
  Future<List<CategoryModel>> fetchCategories();
}
