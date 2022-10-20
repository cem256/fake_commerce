part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _InitialState;
  const factory SearchState.loading() = _LoadingState;
  const factory SearchState.success({required List<ProductModel> searchResults}) = _SuccessState;
  const factory SearchState.failure() = _FailureState;
  const factory SearchState.noResult() = _NoResultState;
}
