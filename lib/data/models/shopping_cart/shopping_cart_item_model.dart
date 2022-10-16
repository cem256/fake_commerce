import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product_model.dart';

part 'shopping_cart_item_model.freezed.dart';
part 'shopping_cart_item_model.g.dart';

@freezed
class ShoppingCartItemModel with _$ShoppingCartItemModel {
  @JsonSerializable(explicitToJson: true)
  const factory ShoppingCartItemModel({
    required ProductModel product,
    @Default(1) int quantity,
  }) = _ShoppingCartItemModel;

  factory ShoppingCartItemModel.fromJson(Map<String, dynamic> json) => _$ShoppingCartItemModelFromJson(json);
}
