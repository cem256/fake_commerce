import '../../models/product/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<ProductModel>> fetchProducts();
}
