import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../views/auth/forgot_password/forgot_password_view.dart';
import '../views/auth/login/login_view.dart';
import '../views/auth/register/register_view.dart';
import '../views/category_detail/category_detail_view.dart';
import '../views/change_password/change_password_view.dart';
import '../views/navbar/navbar_view.dart';
import '../views/settings/settings_view.dart';
import '../views/shopping_cart/shopping_cart_view.dart';
import '../views/store/store_view.dart';
import 'wrapper/authenticated_wrapper.dart';
import 'wrapper/unauthenticated_wrapper.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: "View,Route",
//   routes: <AutoRoute>[
//     MaterialRoute(initial: true, page: LoginView),
//     MaterialRoute(page: RegisterView),
//     MaterialRoute(page: ForgotPasswordView),
//     MaterialRoute(
//       page: NavbarView,
//       initial: true,
//       children: [
//         MaterialRoute(initial: true, page: StoreView),
//         MaterialRoute(page: ShoppingCartView),
//         MaterialRoute(page: SettingsView),
//       ],
//     ),
//     MaterialRoute(page: CategoryDetailView),
//     MaterialRoute(page: ChangePasswordView),
//   ],
// )
// class $AppRouter {}

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    unauthenticatedRouter,
    authenticatedRouter,
  ],
)
class $AppRouter {}

const unauthenticatedRouter = AutoRoute(
  initial: true,
  name: "UnauthenticatedRouter",
  page: UnauthenticatedWrapper,
  children: [
    AutoRoute(
      initial: true,
      page: LoginView,
    ),
    AutoRoute(
      page: RegisterView,
    ),
    AutoRoute(
      page: ForgotPasswordView,
    ),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
);

const authenticatedRouter = AutoRoute(
  name: "AuthenticatedRouter",
  page: AuthenticatedWrapper,
  children: [
    AutoRoute(
      page: NavbarView,
      initial: true,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: "StoreRouter",
          children: [
            AutoRoute(initial: true, page: StoreView),
            AutoRoute(page: CategoryDetailView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          name: "ShoppingCartRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(initial: true, page: ShoppingCartView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          name: "SettingsRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(initial: true, page: SettingsView),
            AutoRoute(page: ChangePasswordView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
  ],
);
