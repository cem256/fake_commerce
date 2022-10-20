import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/page_status.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../data/models/category/category_model.dart';
import '../../../data/models/product/product_model.dart';
import '../../../logic/product/product_bloc.dart';
import '../../widgets/grid/product_grid.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          children: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.status == PageStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status == PageStatus.success) {
                  final List<ProductModel> products =
                      state.products.where((product) => product.category == category.name).toList();
                  return Expanded(
                      child: ProductGrid(
                    products: products,
                  ));
                } else {
                  return Text(
                    "Something went wrong",
                    style: Theme.of(context).textTheme.headline6,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
