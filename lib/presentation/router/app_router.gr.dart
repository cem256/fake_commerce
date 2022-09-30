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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i16;

import '../../data/models/category/category_model.dart' as _i17;
import '../views/auth/forgot_password/forgot_password_view.dart' as _i8;
import '../views/auth/login/login_view.dart' as _i6;
import '../views/auth/register/register_view.dart' as _i7;
import '../views/category_detail/category_detail_view.dart' as _i10;
import '../views/change_password/change_password_view.dart' as _i11;
import '../views/navbar/navbar_view.dart' as _i9;
import '../views/settings/settings_view.dart' as _i14;
import '../views/shopping_cart/shopping_cart_view.dart' as _i13;
import '../views/store/store_view.dart' as _i12;
import 'wrappers/forgot_password_wrapper.dart' as _i5;
import 'wrappers/login_wrapper.dart' as _i3;
import 'wrappers/navbar_wrapper.dart' as _i2;
import 'wrappers/register_wrapper.dart' as _i4;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    UnauthenticatedRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    AuthenticatedRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.WrappedRoute(child: _i2.NavbarWrapper()));
    },
    LoginWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.WrappedRoute(child: _i3.LoginWrapper()));
    },
    RegisterWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.WrappedRoute(child: _i4.RegisterWrapper()));
    },
    ForgotPasswordWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.WrappedRoute(child: _i5.ForgotPasswordWrapper()));
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterView());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ForgotPasswordView());
    },
    NavbarRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.NavbarView());
    },
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.CategoryDetailView(key: args.key, category: args.category));
    },
    ChangePasswordRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ChangePasswordView());
    },
    StoreRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    ShoppingCartRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    StoreRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.StoreView());
    },
    ShoppingCartRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ShoppingCartView());
    },
    SettingsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SettingsView());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(UnauthenticatedRouter.name,
            path: '/empty-router-page',
            children: [
              _i15.RouteConfig(LoginWrapper.name,
                  path: '',
                  parent: UnauthenticatedRouter.name,
                  children: [
                    _i15.RouteConfig(LoginRoute.name,
                        path: '', parent: LoginWrapper.name),
                    _i15.RouteConfig('*#redirect',
                        path: '*',
                        parent: LoginWrapper.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i15.RouteConfig(RegisterWrapper.name,
                  path: '',
                  parent: UnauthenticatedRouter.name,
                  children: [
                    _i15.RouteConfig(RegisterRoute.name,
                        path: 'register-view', parent: RegisterWrapper.name),
                    _i15.RouteConfig('*#redirect',
                        path: '*',
                        parent: RegisterWrapper.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i15.RouteConfig(ForgotPasswordWrapper.name,
                  path: '',
                  parent: UnauthenticatedRouter.name,
                  children: [
                    _i15.RouteConfig(ForgotPasswordRoute.name,
                        path: 'forgot-password-view',
                        parent: ForgotPasswordWrapper.name),
                    _i15.RouteConfig('*#redirect',
                        path: '*',
                        parent: ForgotPasswordWrapper.name,
                        redirectTo: '',
                        fullMatch: true)
                  ])
            ]),
        _i15.RouteConfig(AuthenticatedRouter.name,
            path: '/navbar-wrapper',
            children: [
              _i15.RouteConfig(NavbarRoute.name,
                  path: '',
                  parent: AuthenticatedRouter.name,
                  children: [
                    _i15.RouteConfig(StoreRouter.name,
                        path: '',
                        parent: NavbarRoute.name,
                        children: [
                          _i15.RouteConfig(StoreRoute.name,
                              path: '', parent: StoreRouter.name),
                          _i15.RouteConfig('*#redirect',
                              path: '*',
                              parent: StoreRouter.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i15.RouteConfig(ShoppingCartRouter.name,
                        path: 'empty-router-page',
                        parent: NavbarRoute.name,
                        children: [
                          _i15.RouteConfig(ShoppingCartRoute.name,
                              path: '', parent: ShoppingCartRouter.name),
                          _i15.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShoppingCartRouter.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i15.RouteConfig(SettingsRouter.name,
                        path: 'empty-router-page',
                        parent: NavbarRoute.name,
                        children: [
                          _i15.RouteConfig(SettingsRoute.name,
                              path: '', parent: SettingsRouter.name),
                          _i15.RouteConfig('*#redirect',
                              path: '*',
                              parent: SettingsRouter.name,
                              redirectTo: '',
                              fullMatch: true)
                        ])
                  ]),
              _i15.RouteConfig(CategoryDetailRoute.name,
                  path: 'category-detail-view',
                  parent: AuthenticatedRouter.name),
              _i15.RouteConfig(ChangePasswordRoute.name,
                  path: 'change-password-view',
                  parent: AuthenticatedRouter.name),
              _i15.RouteConfig('*#redirect',
                  path: '*',
                  parent: AuthenticatedRouter.name,
                  redirectTo: '',
                  fullMatch: true)
            ])
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class UnauthenticatedRouter extends _i15.PageRouteInfo<void> {
  const UnauthenticatedRouter({List<_i15.PageRouteInfo>? children})
      : super(UnauthenticatedRouter.name,
            path: '/empty-router-page', initialChildren: children);

  static const String name = 'UnauthenticatedRouter';
}

/// generated route for
/// [_i2.NavbarWrapper]
class AuthenticatedRouter extends _i15.PageRouteInfo<void> {
  const AuthenticatedRouter({List<_i15.PageRouteInfo>? children})
      : super(AuthenticatedRouter.name,
            path: '/navbar-wrapper', initialChildren: children);

  static const String name = 'AuthenticatedRouter';
}

/// generated route for
/// [_i3.LoginWrapper]
class LoginWrapper extends _i15.PageRouteInfo<void> {
  const LoginWrapper({List<_i15.PageRouteInfo>? children})
      : super(LoginWrapper.name, path: '', initialChildren: children);

  static const String name = 'LoginWrapper';
}

/// generated route for
/// [_i4.RegisterWrapper]
class RegisterWrapper extends _i15.PageRouteInfo<void> {
  const RegisterWrapper({List<_i15.PageRouteInfo>? children})
      : super(RegisterWrapper.name, path: '', initialChildren: children);

  static const String name = 'RegisterWrapper';
}

/// generated route for
/// [_i5.ForgotPasswordWrapper]
class ForgotPasswordWrapper extends _i15.PageRouteInfo<void> {
  const ForgotPasswordWrapper({List<_i15.PageRouteInfo>? children})
      : super(ForgotPasswordWrapper.name, path: '', initialChildren: children);

  static const String name = 'ForgotPasswordWrapper';
}

/// generated route for
/// [_i6.LoginView]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.RegisterView]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register-view');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i8.ForgotPasswordView]
class ForgotPasswordRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: 'forgot-password-view');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i9.NavbarView]
class NavbarRoute extends _i15.PageRouteInfo<void> {
  const NavbarRoute({List<_i15.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i10.CategoryDetailView]
class CategoryDetailRoute extends _i15.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({_i16.Key? key, required _i17.CategoryModel category})
      : super(CategoryDetailRoute.name,
            path: 'category-detail-view',
            args: CategoryDetailRouteArgs(key: key, category: category));

  static const String name = 'CategoryDetailRoute';
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({this.key, required this.category});

  final _i16.Key? key;

  final _i17.CategoryModel category;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i11.ChangePasswordView]
class ChangePasswordRoute extends _i15.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password-view');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class StoreRouter extends _i15.PageRouteInfo<void> {
  const StoreRouter({List<_i15.PageRouteInfo>? children})
      : super(StoreRouter.name, path: '', initialChildren: children);

  static const String name = 'StoreRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ShoppingCartRouter extends _i15.PageRouteInfo<void> {
  const ShoppingCartRouter({List<_i15.PageRouteInfo>? children})
      : super(ShoppingCartRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'ShoppingCartRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class SettingsRouter extends _i15.PageRouteInfo<void> {
  const SettingsRouter({List<_i15.PageRouteInfo>? children})
      : super(SettingsRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i12.StoreView]
class StoreRoute extends _i15.PageRouteInfo<void> {
  const StoreRoute() : super(StoreRoute.name, path: '');

  static const String name = 'StoreRoute';
}

/// generated route for
/// [_i13.ShoppingCartView]
class ShoppingCartRoute extends _i15.PageRouteInfo<void> {
  const ShoppingCartRoute() : super(ShoppingCartRoute.name, path: '');

  static const String name = 'ShoppingCartRoute';
}

/// generated route for
/// [_i14.SettingsView]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}
