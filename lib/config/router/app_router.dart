import 'package:auto_route/annotations.dart';

import '../../views/auth/login/login_view.dart';
import '../../views/auth/register/register_view.dart';
import '../../views/home/home_view.dart';
import '../../views/splash/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    MaterialRoute(initial: true, page: SplashView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: HomeView),
  ],
)
class $AppRouter {}
