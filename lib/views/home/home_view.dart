import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../repositories/auth/auth_repository.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeView"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthRepository(firebaseAuth: FirebaseAuth.instance).signOut();
        },
      ),
    );
  }
}