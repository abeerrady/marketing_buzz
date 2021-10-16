import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/favorite/cubits/cubit.dart';
import 'package:marketing_buzz/views/home/cubits/cat_cubits.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';
import '../../../locale_keys.dart';
import 'components/custom_categories.dart';
import 'components/image_slider.dart';
import 'components/product_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cubits/cubit.dart';
import 'cubits/states.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getData(),
        ),
        BlocProvider(create: (context) => CategoryCubit()..getCategories()),
        BlocProvider(create: (context) =>FavoriteController()),
        // BlocProvider(create: (context) => CategoryDetailsCubit()),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) => state is HomeLoadingState
                ? LoadingIndicator()
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ImageSlider(),
                      Text(
                        LocaleKeys.Home_Categories.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      DefaultCategory(),
                      ProductsGridView(), // CustomProduct(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
