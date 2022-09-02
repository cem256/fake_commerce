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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../models/category/category_model.dart' as _i11;
import '../../views/auth/forgot_password/forgot_password_view.dart' as _i3;
import '../../views/auth/login/login_view.dart' as _i1;
import '../../views/auth/register/register_view.dart' as _i2;
import '../../views/category_detail/category_detail_view.dart' as _i5;
import '../../views/navbar/navbar_view.dart' as _i4;
import '../../views/settings/settings_view.dart' as _i8;
import '../../views/shopping_cart/shopping_cart_view.dart' as _i7;
import '../../views/store/store_view.dart' as _i6;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterView());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ForgotPasswordView());
    },
    NavbarRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NavbarView());
    },
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.CategoryDetailView(key: args.key, category: args.category));
    },
    StoreRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.StoreView());
    },
    ShoppingCartRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ShoppingCartView());
    },
    SettingsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingsView());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LoginRoute.name, path: '/'),
        _i9.RouteConfig(RegisterRoute.name, path: '/register-view'),
        _i9.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-view'),
        _i9.RouteConfig(NavbarRoute.name, path: '/', children: [
          _i9.RouteConfig(StoreRoute.name, path: '', parent: NavbarRoute.name),
          _i9.RouteConfig(ShoppingCartRoute.name,
              path: 'shopping-cart-view', parent: NavbarRoute.name),
          _i9.RouteConfig(SettingsRoute.name,
              path: 'settings-view', parent: NavbarRoute.name)
        ]),
        _i9.RouteConfig(CategoryDetailRoute.name, path: '/category-detail-view')
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterView]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-view');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.ForgotPasswordView]
class ForgotPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: '/forgot-password-view');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i4.NavbarView]
class NavbarRoute extends _i9.PageRouteInfo<void> {
  const NavbarRoute({List<_i9.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i5.CategoryDetailView]
class CategoryDetailRoute extends _i9.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({_i10.Key? key, required _i11.CategoryModel category})
      : super(CategoryDetailRoute.name,
            path: '/category-detail-view',
            args: CategoryDetailRouteArgs(key: key, category: category));

  static const String name = 'CategoryDetailRoute';
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({this.key, required this.category});

  final _i10.Key? key;

  final _i11.CategoryModel category;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i6.StoreView]
class StoreRoute extends _i9.PageRouteInfo<void> {
  const StoreRoute() : super(StoreRoute.name, path: '');

  static const String name = 'StoreRoute';
}

/// generated route for
/// [_i7.ShoppingCartView]
class ShoppingCartRoute extends _i9.PageRouteInfo<void> {
  const ShoppingCartRoute()
      : super(ShoppingCartRoute.name, path: 'shopping-cart-view');

  static const String name = 'ShoppingCartRoute';
}

/// generated route for
/// [_i8.SettingsView]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-view');

  static const String name = 'SettingsRoute';
}
