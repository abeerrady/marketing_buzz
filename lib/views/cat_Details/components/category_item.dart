import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/cat_Details/cubits/cubit.dart';
import 'package:marketing_buzz/views/cat_Details/cubits/states.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit =CategoryDetailsCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => state is CategoryDetailsLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : cubit.categoryDetailsModel == null ||
          cubit.categoryDetailsModel.data.data.isEmpty
          ? Center(child: Text('Empty!' , style: TextStyle(fontSize: 30),))
          : GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              // mainAxisExtent: 200,
              childAspectRatio: 1 / 2),
          shrinkWrap: true,
          itemCount: cubit.categoryDetailsModel.data.data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        if (cubit.categoryDetailsModel.data.data[index]
                            .discount !=
                            0)
                          Container(
                            child: Text(
                              'Discount',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                            color: Colors.red,
                            padding: EdgeInsets.all(.8),
                          ),

                        Image.network(
                          cubit.categoryDetailsModel.data.data[index]
                              .image,
                          height: 200,
                          // fit: BoxFit.cover,
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 2),
                    child: Text(
                      cubit.categoryDetailsModel.data.data[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(height: 1.1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cubit
                            .categoryDetailsModel.data.data[index].price
                            .toString(),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      if (cubit.categoryDetailsModel.data.data[index]
                          .discount !=
                          0)
                        Text(
                          cubit.categoryDetailsModel.data.data[index]
                              .oldPrice
                              .toString(),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}