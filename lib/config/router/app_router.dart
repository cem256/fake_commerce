import 'package:auto_route/annotations.dart';
import 'package:fake_commerce_firebase/views/home_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    MaterialRoute(initial: true, page: HomeView),
  ],
)
class $AppRouter {}
