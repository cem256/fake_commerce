import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/auth/bloc/auth_bloc.dart';
import '../../views/store/store_view.dart';
import '../app_router.gr.dart';

class UnauthenticatedWrapper extends StatelessWidget {
  const UnauthenticatedWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (_) => context.router.root.replaceAll([const AuthenticatedRouter()]),
        );
      },
      builder: (context, state) {
        return state.map(
          authenticated: (_) => const StoreView(),
          unauthenticated: (_) => const AutoRouter(),
        );
      },
    );
  }
}
