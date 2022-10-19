part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = InitialState;
  const factory SearchState.loading() = LoadingState;
  const factory SearchState.success({required List<ProductModel> searchResults}) = SuccessState;
  const factory SearchState.failure() = FailureState;
  const factory SearchState.noResult() = NoResultState;
}
