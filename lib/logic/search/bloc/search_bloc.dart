import 'package:bloc/bloc.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/product/product_model.dart';
import '../../../data/repositories/search/base_search_repository.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BaseSearchRepository searchRepository;

  SearchBloc({required this.searchRepository}) : super(const _InitialState()) {
    on<SearchTermChanged>(_onSearchTermChanged, transformer: debounce(const Duration(seconds: 1)));
  }

  Future<void> _onSearchTermChanged(SearchTermChanged event, Emitter<SearchState> emit) async {
    emit(const _LoadingState());
    try {
      if (event.searchTerm.isEmpty) {
        emit(const _InitialState());
      } else {
        final List<ProductModel> searchResults = await searchRepository.getProducts(event.searchTerm);
        if (searchResults.isEmpty) {
          emit(const _NoResultState());
        } else {
          emit(_SuccessState(searchResults: searchResults));
        }
      }
    } catch (_) {
      emit(const _FailureState());
    }
  }
}
