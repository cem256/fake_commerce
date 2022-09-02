import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/blocs.dart';
import 'config/router/app_router.gr.dart';
import 'core/utils/observers/app_bloc_observer.dart';
import 'repositories/repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(FakeCommerce()),
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
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
            googleSignIn: GoogleSignIn.standard(),
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
            )..add(ProductsFetched()),
          ),
          BlocProvider<ShoppingCartBloc>(
            create: (context) => ShoppingCartBloc(),
          ),
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: "Fake Commerce",
              debugShowCheckedModeBanner: false,

              //theme
              themeMode: state.theme,
              theme: FlexColorScheme.light(
                      primary: Colors.orange, appBarBackground: Colors.transparent, appBarElevation: 0)
                  .toTheme,
              darkTheme:
                  FlexColorScheme.dark(primary: Colors.orange, appBarBackground: Colors.transparent, appBarElevation: 0)
                      .toTheme,

              // routing
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            );
          },
        ),
      ),
    );
  }
}
