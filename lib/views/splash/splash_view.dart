import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  static Page<void> route() => const MaterialPage<void>(child: SplashView());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
