import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/home/cubits/cat_cubits.dart';
import 'package:marketing_buzz/views/home/cubits/cat_states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class CategoryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cubit = CategoryCubit()..getCategories();
    return  BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) => state is CategoryLoading ? LoadingIndicator() : ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount:cubit.categoryModel.data.data.length,
          itemBuilder: (context , index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(cubit.categoryModel.data.data[index].image)
                        )
                    ),
                    height: 100,
                    width: 100,

                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          cubit.categoryModel.data.data[index].name,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

        ),
      ),
    );
  }
}
