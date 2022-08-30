import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../repositories/auth/auth_repository.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ).signOut(),
      ),
    );
  }
}
