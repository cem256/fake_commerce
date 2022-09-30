import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/auth/bloc/auth_bloc.dart';
import 'app/theme/theme_bloc.dart';
import 'core/constants/string_constants.dart';
import 'core/theme/theme_manager.dart';
import 'core/utils/observers/app_bloc_observer.dart';
import 'locator.dart';
import 'logic/blocs.dart';
import 'presentation/router/app_router.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  initServices();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => getIt<ThemeBloc>(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => getIt<SettingsBloc>(),
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
                theme: ThemeManager.instance.lightTheme,
                darkTheme: ThemeManager.instance.darkTheme,

                // routing
                routerDelegate: AutoRouterDelegate.declarative(_appRouter, routes: (_) => routes),
                routeInformationParser: _appRouter.defaultRouteParser(),
              );
            },
          );
        },
      ),
    );
  }
}
