import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/services/search_service.dart';
import 'core/theme/theme_manager.dart';
import 'data/repositories/repositories.dart';
import 'logic/blocs.dart';

// Global service locator
final GetIt getIt = GetIt.instance;

void initServices() {
  //Services
  getIt
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<GoogleSignIn>(GoogleSignIn.standard)
    ..registerLazySingleton(SearchService.new)
    ..registerLazySingleton(ThemeManager.new)

    //Repositories
    ..registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(
        firebaseAuth: getIt(),
        googleSignIn: getIt(),
      ),
    )
    ..registerLazySingleton<BaseUserRepository>(
      () => UserRepository(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<BaseCategoryRepository>(
      () => CategoryRepository(
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<BaseProductRepository>(
      () => ProductRepository(
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<BaseShoppingCartRepostiory>(
      () => ShoppingCartRepository(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<BaseSearchRepository>(
      () => SearchRepository(
        searchService: getIt(),
      ),
    )

    //Blocs
    ..registerFactory(
      () => AuthBloc(
        authRepository: getIt(),
      ),
    )
    ..registerFactory(
      ThemeBloc.new,
    )
    ..registerFactory(
      () => RegisterBloc(
        authRepository: getIt(),
        userRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => LoginBloc(
        authRepository: getIt(),
        userRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => ForgotPasswordBloc(
        authRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => CategoryBloc(
        categoryRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => ProductBloc(
        productRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => SettingsBloc(
        authRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => ChangePasswordBloc(
        authRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => ShoppingCartBloc(shoppingCartRepostiory: getIt()),
    )
    ..registerFactory(
      () => SearchBloc(
        searchRepository: getIt(),
      ),
    );
}
