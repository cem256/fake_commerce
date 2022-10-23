import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../logic/category/category_bloc.dart';
import '../../../logic/product/product_bloc.dart';
import '../../../logic/settings/settings_bloc.dart';
import '../../../logic/shopping_cart/shopping_cart_bloc.dart';

class NavbarWrapper implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductBloc>()..add(const ProductEvent.productsFetched()),
        ),
        BlocProvider(
          create: (context) => getIt<CategoryBloc>()..add(const CategoryEvent.categoriesFetched()),
        ),
        BlocProvider(
          create: (context) => getIt<ShoppingCartBloc>()..add(const ShoppingCartEvent.loadShoppingCart()),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => getIt<SettingsBloc>(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
