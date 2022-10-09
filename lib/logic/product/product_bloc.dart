import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/product/product_model.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../../core/enums/page_status.dart';

part 'product_bloc.freezed.dart';
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
