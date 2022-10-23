import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/string_constants.dart';
import '../../../core/enums/page_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../logic/category/category_bloc.dart';
import '../../../logic/product/product_bloc.dart';
import '../../widgets/carousel/category_carousel.dart';
import '../../widgets/grid/product_grid.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.title),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SearchRoute()),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const _StoreViewBody(),
    );
  }
}

class _StoreViewBody extends StatelessWidget {
  const _StoreViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state.status == PageStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == PageStatus.success) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                    ),
                    items: state.categories.map((category) => CategoryCarousel(category: category)).toList(),
                  );
                } else {
                  return const Center(child: Text("Some Error"));
                }
              },
            ),
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          Text(
            "All Products",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          Expanded(
            flex: 6,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.status == PageStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == PageStatus.success) {
                  return ProductGrid(
                    products: state.products,
                  );
                } else {
                  return const Center(child: Text("Some Error"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
