import '../../models/product/product_model.dart';

abstract class BaseProductRepository {
  Future<List<ProductModel>> fetchProducts();
}
