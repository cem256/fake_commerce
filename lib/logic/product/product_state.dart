part of 'product_bloc.dart';

class ProductState extends Equatable {
  final PageStatus status;
  final List<ProductModel> products;

  const ProductState({
    this.status = PageStatus.initial,
    this.products = const [],
  });

  @override
  List<Object> get props => [status, products];

  ProductState copyWith({
    PageStatus? status,
    List<ProductModel>? products,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
