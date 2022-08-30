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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../views/auth/forgot_password/forgot_password_view.dart' as _i3;
import '../../views/auth/login/login_view.dart' as _i1;
import '../../views/auth/register/register_view.dart' as _i2;
import '../../views/home/home_view.dart' as _i5;
import '../../views/navbar/navbar_view.dart' as _i4;
import '../../views/shopping_cart/shopping_cart_view.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterView());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ForgotPasswordView());
    },
    NavbarRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NavbarView());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeView());
    },
    ShoppingCartRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ShoppingCartView());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginRoute.name, path: '/'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register-view'),
        _i7.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-view'),
        _i7.RouteConfig(NavbarRoute.name, path: '/', children: [
          _i7.RouteConfig(HomeRoute.name, path: '', parent: NavbarRoute.name),
          _i7.RouteConfig(ShoppingCartRoute.name,
              path: 'shopping-cart-view', parent: NavbarRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterView]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-view');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.ForgotPasswordView]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: '/forgot-password-view');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i4.NavbarView]
class NavbarRoute extends _i7.PageRouteInfo<void> {
  const NavbarRoute({List<_i7.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.ShoppingCartView]
class ShoppingCartRoute extends _i7.PageRouteInfo<void> {
  const ShoppingCartRoute()
      : super(ShoppingCartRoute.name, path: 'shopping-cart-view');

  static const String name = 'ShoppingCartRoute';
}
