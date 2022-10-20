import '../../models/product/product_model.dart';

abstract class BaseSearchRepository {
  Future<List<ProductModel>> getProducts(String searchTerm);
}
