import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app/auth/bloc/auth_bloc.dart';
import 'app/theme/theme_bloc.dart';
import 'data/repositories/auth/auth_repository.dart';
import 'data/repositories/category/category_repository.dart';
import 'data/repositories/product/product_repository.dart';
import 'data/repositories/user/user_repository.dart';
import 'logic/blocs.dart';
import 'logic/change_password/change_password_bloc.dart';

// Global service locator
final GetIt getIt = GetIt.instance;

void initServices() {
  //Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.standard());

  //Repositories
  getIt.registerLazySingleton(
    () => AuthRepository(
      firebaseAuth: getIt(),
      googleSignIn: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => UserRepository(
      firebaseFirestore: getIt(),
      firebaseAuth: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => CategoryRepository(
      firebaseFirestore: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => ProductRepository(
      firebaseFirestore: getIt(),
    ),
  );

  //Blocs
  getIt.registerFactory(
    () => AuthBloc(
      authRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ThemeBloc(),
  );
  getIt.registerFactory(
    () => RegisterBloc(
      authRepository: getIt(),
      userRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => LoginBloc(
      authRepository: getIt(),
      userRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ForgotPasswordBloc(
      authRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => CategoryBloc(
      categoryRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ProductBloc(
      productRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => SettingsBloc(
      authRepository: getIt(),
      userRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ChangePasswordBloc(
      authRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ShoppingCartBloc(),
  );
}
