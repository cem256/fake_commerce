import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../config/router/app_router.gr.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.unauthenticated) {
          context.router.replace(const LoginRoute());
        } else if (state.status == AuthStatus.authenticated) {
          context.router.replace(const HomeRoute());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Splash View"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
        ),
      ),
    );
  }
}
