import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../../presentation/views/auth/forgot_password/forgot_password_view.dart';
import '../../presentation/views/auth/login/login_view.dart';
import '../../presentation/views/auth/register/register_view.dart';
import '../../presentation/views/category_detail/category_detail_view.dart';
import '../../presentation/views/change_password/change_password_view.dart';
import '../../presentation/views/navbar/navbar_view.dart';
import '../../presentation/views/settings/settings_view.dart';
import '../../presentation/views/shopping_cart/shopping_cart_view.dart';
import '../../presentation/views/store/store_view.dart';
import 'wrappers/navbar_wrapper.dart';

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
  name: "UnauthenticatedRouter",
  page: EmptyRouterPage,
  children: [
    AutoRoute(initial: true, page: LoginView),
    AutoRoute(page: RegisterView),
    AutoRoute(page: ForgotPasswordView),
    RedirectRoute(path: '*', redirectTo: ''),
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
    AutoRoute(page: ChangePasswordView),
    AutoRoute(page: CategoryDetailView),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
);
