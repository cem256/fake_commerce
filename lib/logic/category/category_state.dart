part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<CategoryModel> categories,
  }) = _CategoryState;
}
