import 'package:equatable/equatable.dart';

import '../product/product_model.dart';

class ShoppingCartModel extends Equatable {
  final ProductModel product;
  int count;

  ShoppingCartModel(this.product, this.count);

  @override
  List<Object?> get props => [product];
}
