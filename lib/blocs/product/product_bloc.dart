import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/enums/page_status.dart';
import '../../models/product/product_model.dart';
import '../../repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<ProductsFetched>(_onProductsFetched);
  }

  Future<void> _onProductsFetched(ProductsFetched event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));

    await emit.forEach<List<ProductModel>>(
      productRepository.fetchProducts(),
      onData: (products) => state.copyWith(products: products, status: PageStatus.success),
      onError: (_, __) => state.copyWith(status: PageStatus.failure),
    );
  }
}
