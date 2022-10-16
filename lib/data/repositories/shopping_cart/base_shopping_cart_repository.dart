import '../../models/product/product_model.dart';
import '../../models/shopping_cart/shopping_cart_item_model.dart';
import '../../models/user/user_model.dart';

abstract class BaseShoppingCartRepostiory {
  UserModel get currentUser;
  void createUserCart();

  Stream<List<ShoppingCartItemModel>> getUserCart();
  Future<void> addItemToCart(List<ShoppingCartItemModel> cartItems, ProductModel product);
  Future<void> decreaseQuantity(ShoppingCartItemModel cartItem);
  Future<void> increaseQuantity(ShoppingCartItemModel cartItem);
  double calculateSubtotal(List<ShoppingCartItemModel> userCart);
}
