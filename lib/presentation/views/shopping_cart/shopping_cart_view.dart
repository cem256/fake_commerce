import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../data/models/shopping_cart/shopping_cart_model.dart';
import '../../../logic/blocs.dart';
import '../../widgets/cards/shopping_cart_card.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(
              child: Text(
                "Your cart is empty",
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
                      itemBuilder: ((context, index) {
                        ShoppingCartModel cartItem = state.cartItems[index];
                        return ShoppingCartCard(cartItem: cartItem);
                      }),
                    ),
                  ),
                  const Divider(thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUBTOTAL",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        "\$${state.subtotal.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
