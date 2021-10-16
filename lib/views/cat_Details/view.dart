import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/basket/cubits/cart_cubit.dart';
import 'package:marketing_buzz/views/cat_Details/cubits/cubit.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

import 'components/category_item.dart';

class CategoryDetails extends StatelessWidget {
  final int id;

  CategoryDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryDetailsCubit()..getProduct(id),
        ),
        BlocProvider(
          create: (context) => CartController(),
        )
      ],
      child: Scaffold(
          appBar: MyAppBar(text: 'Category Details'),
          body: CategoryItem()),
    );
  }
}