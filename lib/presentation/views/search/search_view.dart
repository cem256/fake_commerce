import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../locator.dart';
import '../../../logic/search/bloc/search_bloc.dart';
import '../../widgets/grid/product_grid.dart';
import '../../widgets/input/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: const _SearchViewBody(),
    );
  }
}

class _SearchViewBody extends StatelessWidget {
  const _SearchViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchTextField(
          hintText: 'Search Products',
          onChanged: (searchTerm) => context.read<SearchBloc>().add(SearchTermChanged(searchTerm)),
        ),
      ),
      body: Padding(
        padding: context.paddingAllDefault,
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: context.highValue,
                    ),
                    SizedBox(
                      height: context.mediumValue,
                    ),
                    Text(
                      'Find your stuff.',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (state) => ProductGrid(
                products: state.searchResults,
              ),
              failure: (_) => Center(
                child: Text(
                  'Something went wrong',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              noResult: (_) => Center(
                child: Text(
                  'No results found',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
