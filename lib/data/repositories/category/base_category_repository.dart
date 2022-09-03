import '../../models/category/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<CategoryModel>> fetchCategories();
}
