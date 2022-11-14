import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums/page_status.dart';
import '../../data/models/category/category_model.dart';
import '../../data/repositories/category/base_category_repository.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.categoryRepository}) : super(const CategoryState()) {
    on<_CategoriesFetched>(_onCategoriesFetched);
  }
  final BaseCategoryRepository categoryRepository;

  Future<void> _onCategoriesFetched(_CategoriesFetched event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));

    try {
      final categories = await categoryRepository.fetchCategories();
      emit(state.copyWith(categories: categories, status: PageStatus.success));
    } catch (_) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }
}
