// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../views/auth/login/login_view.dart' as _i2;
import '../../views/auth/register/register_view.dart' as _i3;
import '../../views/home/home_view.dart' as _i4;
import '../../views/splash/splash_view.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterView());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashRoute.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: '/login-view'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register-view'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-view');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterView]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-view');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-view');

  static const String name = 'HomeRoute';
}
