import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/product/product_model.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const InitialState()) {
    on<SearchTermChanged>(_onSearchTermChanged);
  }

  //TODO: implement throttle mechanism

  Future<void> _onSearchTermChanged(SearchTermChanged event, Emitter<SearchState> emit) async {
    emit(const LoadingState());
    try {
      // TODO: implement search service
      List<ProductModel> searchResults = [];
      if (searchResults.isEmpty) {
        emit(const NoResultState());
      } else {
        emit(SuccessState(searchResults: searchResults));
      }
    } catch (_) {
      emit(const FailureState());
    }
  }
}
