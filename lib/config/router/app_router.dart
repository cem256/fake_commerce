import 'package:auto_route/auto_route.dart';
import '../../views/wishlist/wishlist_view.dart';

import '../../views/auth/forgot_password/forgot_password_view.dart';
import '../../views/auth/login/login_view.dart';
import '../../views/auth/register/register_view.dart';
import '../../views/home/home_view.dart';
import '../../views/navbar/navbar_view.dart';
import '../../views/shopping_cart/shopping_cart_view.dart';

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
        MaterialRoute(initial: true, page: HomeView),
        MaterialRoute(page: ShoppingCartView),
        MaterialRoute(page: WishListView),
      ],
    ),
  ],
)
class $AppRouter {}
