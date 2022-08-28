import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../repositories/auth/auth_repository.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static Page<void> route() => const MaterialPage(child: HomeView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ).signOut(),
      ),
    );
  }
}
