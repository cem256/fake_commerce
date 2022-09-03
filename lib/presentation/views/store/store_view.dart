import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/page_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../logic/blocs.dart';
import '../../widgets/carousel/category_carousel.dart';
import '../../widgets/grid/product_grid.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Commerce"),
      ),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
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
      ),
    );
  }
}
