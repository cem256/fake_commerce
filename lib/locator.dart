import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'data/repositories/repositories.dart';
import 'logic/blocs.dart';
import 'logic/search/bloc/search_bloc.dart';

// Global service locator
final GetIt getIt = GetIt.instance;

void initServices() {
  //Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.standard());

  //Repositories
  getIt.registerLazySingleton<BaseAuthRepository>(
    () => AuthRepository(
      firebaseAuth: getIt(),
      googleSignIn: getIt(),
    ),
  );

  getIt.registerLazySingleton<BaseUserRepository>(
    () => UserRepository(
      firebaseAuth: getIt(),
      firebaseFirestore: getIt(),
    ),
  );

  getIt.registerLazySingleton<BaseCategoryRepository>(
    () => CategoryRepository(
      firebaseFirestore: getIt(),
    ),
  );

  getIt.registerLazySingleton<BaseProductRepository>(
    () => ProductRepository(
      firebaseFirestore: getIt(),
    ),
  );

  getIt.registerLazySingleton<BaseShoppingCartRepostiory>(
    () => ShoppingCartRepository(
      firebaseAuth: getIt(),
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
    ),
  );
  getIt.registerFactory(
    () => ChangePasswordBloc(
      authRepository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ShoppingCartBloc(shoppingCartRepostiory: getIt()),
  );
  getIt.registerFactory(
    () => SearchBloc(),
  );
}
