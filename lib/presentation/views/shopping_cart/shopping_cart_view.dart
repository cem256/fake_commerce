import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/page_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../logic/shopping_cart/shopping_cart_bloc.dart';
import '../../widgets/cards/shopping_cart_card.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
          if (state.status == PageStatus.initial || state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.success) {
            if (state.cartItems.isEmpty) {
              return Center(
                child: Text(
                  'Your cart is empty',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            } else {
              return Padding(
                padding: context.paddingAllDefault,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(thickness: 2),
                        itemCount: state.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = state.cartItems[index];
                          return ShoppingCartCard(cartItem: cartItem);
                        },
                      ),
                    ),
                    const Divider(thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '\$${state.subtotal.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: Text(
                'An error occurred while fetching your shopping cart',
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          }
        },
      ),
    );
  }
}
