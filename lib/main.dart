import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/auth/bloc/auth_bloc.dart';
import 'app/theme/theme_bloc.dart';
import 'core/constants/string_constants.dart';
import 'core/router/app_router.gr.dart';
import 'core/theme/theme_manager.dart';
import 'core/utils/environment/environment.dart';
import 'core/utils/observers/app_bloc_observer.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: Environment.fileName);

  initServices();

  runApp(FakeCommerce());
}

class FakeCommerce extends StatelessWidget {
  FakeCommerce({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => getIt<ThemeBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final routes = <PageRouteInfo<dynamic>>[];

              authState.whenOrNull(
                authenticated: (_) => routes.add(const AuthenticatedRouter()),
                unauthenticated: () => routes.add(const UnauthenticatedRouter()),
              );

              return MaterialApp.router(
                title: StringConstants.title,
                debugShowCheckedModeBanner: false,

                //theme
                themeMode: themeState.theme,
                theme: getIt<ThemeManager>().lightTheme,
                darkTheme: getIt<ThemeManager>().darkTheme,

                // routing
                routerDelegate: AutoRouterDelegate.declarative(
                  _appRouter,
                  routes: (_) => routes,
                ),
                routeInformationParser: _appRouter.defaultRouteParser(),
              );
            },
          );
        },
      ),
    );
  }
}
