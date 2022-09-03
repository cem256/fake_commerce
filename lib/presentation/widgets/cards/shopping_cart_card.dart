import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../data/models/shopping_cart/shopping_cart_model.dart';
import '../../../logic/shopping_cart/shopping_cart_bloc.dart';

class ShoppingCartCard extends StatelessWidget {
  const ShoppingCartCard({super.key, required this.cartItem});

  final ShoppingCartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: context.defaultBorderRadius,
          child: Container(
            height: context.veryHighValue,
            width: context.veryHighValue,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  cartItem.product.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: context.lowValue,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.product.name, maxLines: 2),
              Text(
                "\$${cartItem.product.price} x ${cartItem.count}",
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => context.read<ShoppingCartBloc>().add(ProductCountDecreased(cartItem)),
              icon: const Icon(Icons.remove_circle),
            ),
            Text(cartItem.count.toString()),
            IconButton(
              onPressed: () => context.read<ShoppingCartBloc>().add(ProductCountIncreased(cartItem)),
              icon: const Icon(Icons.add_circle),
            ),
          ],
        ),
      ],
    );
  }
}
