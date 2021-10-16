import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/views/cat_Details/view.dart';
import 'package:marketing_buzz/views/home/cubits/cat_cubits.dart';
import 'package:marketing_buzz/views/home/cubits/cat_states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class DefaultCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = CategoryCubit.get(context);
    return BlocBuilder<CategoryCubit, CategoryStates>(
      bloc: category,
      builder: (context, state) => state is CategoryLoading
          ? LoadingIndicator()
          : Container(
              height: 180,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: category.categoryModel.data.data.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(CategoryDetails(
                              category.categoryModel.data.data[index].id));
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(category
                                    .categoryModel.data.data[index].image)),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(category.categoryModel.data.data[index].name),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
