import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/product/product_model.dart';
import '../../core/enums/page_status.dart';
import '../../data/repositories/product/base_product_repository.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final BaseProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<_ProductsFetched>(_onProductsFetched);
  }

  Future<void> _onProductsFetched(_ProductsFetched event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final products = await productRepository.fetchProducts();
      emit(state.copyWith(products: products, status: PageStatus.success));
    } catch (_) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }
}
