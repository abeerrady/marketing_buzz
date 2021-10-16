import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/search/cubits/cubit.dart';
import 'package:marketing_buzz/views/search/cubits/states.dart';
import 'package:marketing_buzz/widgets/divider.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => state is SearchLoading
          ? Center(child: LoadingIndicator())
          : cubit.searchModel == null
              ? Center(
                  child: Text('No Result'),
                )
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cubit.searchModel.data.data.length,
                  itemBuilder: (BuildContext context, int index) => Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    cubit.searchModel.data.data[index].image))),
                      ),
                      Expanded(
                        child: Column(

                          children: [
                            Text(
                              cubit.searchModel.data.data[index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  cubit.searchModel.data.data[index].oldPrice
                                      .toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.red),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  cubit.searchModel.data.data[index].price
                                      .toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      MyDivider(),
                ),
    );
  }
}
