import '../../models/product/product_model.dart';
import '../../models/user/user_model.dart';

abstract class BaseShoppingCartRepostiory {
  UserModel get currentUser;
  void createUserCart();
  Future<void> addItemToCart(ProductModel product);
  Future<void> removeItemFromCart(ProductModel product);
}
