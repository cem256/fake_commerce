import 'package:auto_route/auto_route.dart';

import '../../views/auth/forgot_password/forgot_password_view.dart';
import '../../views/auth/login/login_view.dart';
import '../../views/auth/register/register_view.dart';
import '../../views/category_detail/category_detail_view.dart';
import '../../views/navbar/navbar_view.dart';
import '../../views/shopping_cart/shopping_cart_view.dart';
import '../../views/store/store_view.dart';
import '../../views/wishlist/wishlist_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    MaterialRoute(initial: true, page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(
      page: NavbarView,
      initial: true,
      children: [
        MaterialRoute(initial: true, page: StoreView),
        MaterialRoute(page: ShoppingCartView),
        MaterialRoute(page: WishListView),
      ],
    ),
    MaterialRoute(page: CategoryDetailView),
  ],
)
class $AppRouter {}
