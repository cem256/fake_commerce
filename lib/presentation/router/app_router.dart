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
import 'wrappers/forgot_password_wrapper.dart';
import 'wrappers/login_wrapper.dart';
import 'wrappers/navbar_wrapper.dart';
import 'wrappers/register_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  preferRelativeImports: true,
  routes: [
    unauthenticatedRouter,
    authenticatedRouter,
  ],
)
class $AppRouter {}

const unauthenticatedRouter = AutoRoute(
  initial: true,
  name: "UnauthenticatedRouter",
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: LoginWrapper,
      children: [
        AutoRoute(initial: true, page: LoginView),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      initial: true,
      page: RegisterWrapper,
      children: [
        AutoRoute(page: RegisterView),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      initial: true,
      page: ForgotPasswordWrapper,
      children: [
        AutoRoute(page: ForgotPasswordView),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
);

const authenticatedRouter = AutoRoute(
  name: "AuthenticatedRouter",
  page: NavbarWrapper,
  children: [
    AutoRoute(
      page: NavbarView,
      initial: true,
      children: [
        AutoRoute(
          initial: true,
          page: EmptyRouterPage,
          name: "StoreRouter",
          children: [
            AutoRoute(initial: true, page: StoreView),
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
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
    AutoRoute(page: CategoryDetailView),
    AutoRoute(page: ChangePasswordView),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
);
