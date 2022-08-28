import 'package:flutter/material.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../views/auth/login/login_view.dart';
import '../../views/home/home_view.dart';
import '../../views/splash/splash_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.unknown:
      return [SplashView.route()];
    case AuthStatus.unauthenticated:
      return [LoginView.route()];
    case AuthStatus.authenticated:
      return [HomeView.route()];
  }
}
