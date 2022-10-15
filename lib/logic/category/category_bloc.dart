import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums/page_status.dart';
import '../../../data/models/category/category_model.dart';
import '../../data/repositories/category/base_category_repository.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final BaseCategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(const CategoryState()) {
    on<CategoriesFetched>(_onCategoriesFetched);
  }

  Future<void> _onCategoriesFetched(CategoriesFetched event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));

    await emit.forEach<List<CategoryModel>>(
      categoryRepository.fetchCategories(),
      onData: (categories) => state.copyWith(categories: categories, status: PageStatus.success),
      onError: (_, __) => state.copyWith(status: PageStatus.failure),
    );
  }
}
