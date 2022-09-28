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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:auto_route/empty_router_widgets.dart' as _i7;
import 'package:flutter/material.dart' as _i14;

import '../../data/models/category/category_model.dart' as _i15;
import '../views/auth/forgot_password/forgot_password_view.dart' as _i5;
import '../views/auth/login/login_view.dart' as _i3;
import '../views/auth/register/register_view.dart' as _i4;
import '../views/category_detail/category_detail_view.dart' as _i9;
import '../views/change_password/change_password_view.dart' as _i12;
import '../views/navbar/navbar_view.dart' as _i6;
import '../views/settings/settings_view.dart' as _i11;
import '../views/shopping_cart/shopping_cart_view.dart' as _i10;
import '../views/store/store_view.dart' as _i8;
import 'wrapper/authenticated_wrapper.dart' as _i2;
import 'wrapper/unauthenticated_wrapper.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    UnauthenticatedRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UnauthenticatedWrapper());
    },
    AuthenticatedRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthenticatedWrapper());
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterView());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgotPasswordView());
    },
    NavbarRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.NavbarView());
    },
    StoreRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    ShoppingCartRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    StoreRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.StoreView());
    },
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i9.CategoryDetailView(key: args.key, category: args.category));
    },
    ShoppingCartRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ShoppingCartView());
    },
    SettingsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingsView());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ChangePasswordView());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(UnauthenticatedRouter.name, path: '/', children: [
          _i13.RouteConfig(LoginRoute.name,
              path: '', parent: UnauthenticatedRouter.name),
          _i13.RouteConfig(RegisterRoute.name,
              path: 'register-view', parent: UnauthenticatedRouter.name),
          _i13.RouteConfig(ForgotPasswordRoute.name,
              path: 'forgot-password-view', parent: UnauthenticatedRouter.name),
          _i13.RouteConfig('*#redirect',
              path: '*',
              parent: UnauthenticatedRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i13.RouteConfig(AuthenticatedRouter.name,
            path: '/authenticated-wrapper',
            children: [
              _i13.RouteConfig(NavbarRoute.name,
                  path: '',
                  parent: AuthenticatedRouter.name,
                  children: [
                    _i13.RouteConfig(StoreRouter.name,
                        path: 'empty-router-page',
                        parent: NavbarRoute.name,
                        children: [
                          _i13.RouteConfig(StoreRoute.name,
                              path: '', parent: StoreRouter.name),
                          _i13.RouteConfig(CategoryDetailRoute.name,
                              path: 'category-detail-view',
                              parent: StoreRouter.name),
                          _i13.RouteConfig('*#redirect',
                              path: '*',
                              parent: StoreRouter.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i13.RouteConfig(ShoppingCartRouter.name,
                        path: 'empty-router-page',
                        parent: NavbarRoute.name,
                        children: [
                          _i13.RouteConfig(ShoppingCartRoute.name,
                              path: '', parent: ShoppingCartRouter.name),
                          _i13.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShoppingCartRouter.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i13.RouteConfig(SettingsRouter.name,
                        path: 'empty-router-page',
                        parent: NavbarRoute.name,
                        children: [
                          _i13.RouteConfig(SettingsRoute.name,
                              path: '', parent: SettingsRouter.name),
                          _i13.RouteConfig(ChangePasswordRoute.name,
                              path: 'change-password-view',
                              parent: SettingsRouter.name),
                          _i13.RouteConfig('*#redirect',
                              path: '*',
                              parent: SettingsRouter.name,
                              redirectTo: '',
                              fullMatch: true)
                        ])
                  ])
            ])
      ];
}

/// generated route for
/// [_i1.UnauthenticatedWrapper]
class UnauthenticatedRouter extends _i13.PageRouteInfo<void> {
  const UnauthenticatedRouter({List<_i13.PageRouteInfo>? children})
      : super(UnauthenticatedRouter.name, path: '/', initialChildren: children);

  static const String name = 'UnauthenticatedRouter';
}

/// generated route for
/// [_i2.AuthenticatedWrapper]
class AuthenticatedRouter extends _i13.PageRouteInfo<void> {
  const AuthenticatedRouter({List<_i13.PageRouteInfo>? children})
      : super(AuthenticatedRouter.name,
            path: '/authenticated-wrapper', initialChildren: children);

  static const String name = 'AuthenticatedRouter';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterView]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register-view');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.ForgotPasswordView]
class ForgotPasswordRoute extends _i13.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: 'forgot-password-view');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i6.NavbarView]
class NavbarRoute extends _i13.PageRouteInfo<void> {
  const NavbarRoute({List<_i13.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class StoreRouter extends _i13.PageRouteInfo<void> {
  const StoreRouter({List<_i13.PageRouteInfo>? children})
      : super(StoreRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'StoreRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class ShoppingCartRouter extends _i13.PageRouteInfo<void> {
  const ShoppingCartRouter({List<_i13.PageRouteInfo>? children})
      : super(ShoppingCartRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'ShoppingCartRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class SettingsRouter extends _i13.PageRouteInfo<void> {
  const SettingsRouter({List<_i13.PageRouteInfo>? children})
      : super(SettingsRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i8.StoreView]
class StoreRoute extends _i13.PageRouteInfo<void> {
  const StoreRoute() : super(StoreRoute.name, path: '');

  static const String name = 'StoreRoute';
}

/// generated route for
/// [_i9.CategoryDetailView]
class CategoryDetailRoute extends _i13.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({_i14.Key? key, required _i15.CategoryModel category})
      : super(CategoryDetailRoute.name,
            path: 'category-detail-view',
            args: CategoryDetailRouteArgs(key: key, category: category));

  static const String name = 'CategoryDetailRoute';
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({this.key, required this.category});

  final _i14.Key? key;

  final _i15.CategoryModel category;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i10.ShoppingCartView]
class ShoppingCartRoute extends _i13.PageRouteInfo<void> {
  const ShoppingCartRoute() : super(ShoppingCartRoute.name, path: '');

  static const String name = 'ShoppingCartRoute';
}

/// generated route for
/// [_i11.SettingsView]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i12.ChangePasswordView]
class ChangePasswordRoute extends _i13.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password-view');

  static const String name = 'ChangePasswordRoute';
}
