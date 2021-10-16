import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/search/cubits/cubit.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

import 'components/search_field.dart';
import 'components/search_result.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit();
    return BlocProvider(
      create:(context)=> cubit,
      child: Scaffold(
            appBar: MyAppBar(text: 'Search'),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SearchField(),
                      SizedBox(
                        height: 20,
                      ),
                      SearchResult(),
                    ],
                  ),
                )
              ],
            ),
          ),
    );

  }
}
