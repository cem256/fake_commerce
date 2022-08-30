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
  StreamSubscription? _productSubscription;

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<ProductsFetched>(_onProductsFetched);
  }

  void _onProductsFetched(ProductsFetched event, Emitter<ProductState> emit) {
    emit(state.copyWith(status: PageStatus.loading));

    _productSubscription?.cancel();
    _productSubscription = productRepository
        .fetchProducts()
        .listen((products) => emit(state.copyWith(status: PageStatus.success, products: products)));
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }
}
