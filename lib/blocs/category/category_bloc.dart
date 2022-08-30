import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/category/category_repository.dart';

import '../../constants/enums/page_status.dart';
import '../../models/category/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required this.categoryRepository}) : super(const CategoryState()) {
    on<CategoriesFetched>(_onCategoriesFetched);
  }

  void _onCategoriesFetched(CategoriesFetched event, Emitter<CategoryState> emit) {
    emit(state.copyWith(status: PageStatus.loading));

    _categorySubscription?.cancel();
    _categorySubscription = categoryRepository
        .fetchCategories()
        .listen((categories) => emit(state.copyWith(status: PageStatus.success, categories: categories)));
  }

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }
}
