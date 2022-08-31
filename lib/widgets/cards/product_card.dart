import '../../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../models/product/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.defaultBorderRadius,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  product.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: context.dynamicHeight(0.08),
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: context.paddingAllLow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name.toString(),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                          Text(
                            "\$${product.price.toString()}",
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
