import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/auth/bloc/auth_bloc.dart';
import '../../views/auth/login/login_view.dart';
import '../app_router.gr.dart';

class AuthenticatedWrapper extends StatelessWidget {
  const AuthenticatedWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () => context.router.root.replaceAll([const UnauthenticatedRouter()]),
        );
      },
      builder: (context, state) {
        return state.map(
          unauthenticated: (_) => const LoginView(),
          authenticated: (_) => const AutoRouter(),
        );
      },
    );
  }
}
