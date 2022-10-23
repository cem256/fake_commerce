part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<ProductModel> products,
  }) = _ProductState;
}
