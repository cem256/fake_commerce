import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../logic/search/bloc/search_bloc.dart';
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
  const _SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchTextField(
          hintText: "Search Products",
          onChanged: (searchTerm) {},
        ),
      ),
    );
  }
}
