part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final PageStatus status;
  final List<CategoryModel> categories;

  const CategoryState({
    this.status = PageStatus.initial,
    this.categories = const [],
  });

  @override
  List<Object> get props => [status, categories];

  CategoryState copyWith({
    PageStatus? status,
    List<CategoryModel>? categories,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }
}
