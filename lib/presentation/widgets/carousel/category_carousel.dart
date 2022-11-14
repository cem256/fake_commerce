import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../data/models/category/category_model.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.defaultBorderRadius,
      child: InkWell(
        onTap: () => context.router.push(CategoryDetailRoute(category: category)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    category.imageUrl,
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
                padding: context.paddingAllDefault,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  category.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
