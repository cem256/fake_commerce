import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/enums/page_status.dart';
import '../../models/category/category_model.dart';
import '../../repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

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
