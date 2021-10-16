import 'package:flutter/material.dart';
import 'package:marketing_buzz/views/search/cubits/cubit.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return Container(
      height: 55,
      child: defaultFormField(
          hint: 'Search here',
          prefix: Icons.search,
          controller: cubit.searchController,
          suffix: Icons.search,
          suffixPressed: ()async {
            await cubit.getSearch();
          }),
    );
  }
}
