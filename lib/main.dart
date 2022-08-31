import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'config/router/app_router.gr.dart';
import 'core/utils/observers/app_bloc_observer.dart';
import 'repositories/repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();
  runApp(FakeCommerce());
}

class FakeCommerce extends StatelessWidget {
  FakeCommerce({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        RepositoryProvider<CategoryRepository>(
          create: (context) => CategoryRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<ForgotPasswordBloc>(
            create: (context) => ForgotPasswordBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>(),
            )..add(CategoriesFetched()),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              productRepository: context.read<ProductRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: "Fake Commerce",
          debugShowCheckedModeBanner: false,

          //theme
          themeMode: ThemeMode.system,
          theme: FlexColorScheme.light(primary: Colors.orange, appBarBackground: Colors.transparent, appBarElevation: 0)
              .toTheme,
          darkTheme:
              FlexColorScheme.dark(primary: Colors.orange, appBarBackground: Colors.transparent, appBarElevation: 0)
                  .toTheme,

          // routing
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
