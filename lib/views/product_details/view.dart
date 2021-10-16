import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/favorite/cubits/cubit.dart';
import 'package:marketing_buzz/views/product_details/cubits/states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';
import 'components/product_Info.dart';

import 'components/product_tail.dart';
import 'cubits/cubit.dart';

class ProductDetails extends StatelessWidget {
  final int id;
  ProductDetails(this.id);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
      BlocProvider(
          create: (context) => ProductDetailsCubit()..getDetails(this.id)),
        BlocProvider(
            create: (context) =>FavoriteController()),
      ],

          child: Scaffold(
              appBar: MyAppBar(text: 'Product Details'),
              body: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
                builder: (context, state) => state is ProductDetailsLoading
                    ? Center(
                        child: LoadingIndicator(),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                ProductDetailsInfo(
                                  image: ProductDetailsCubit.of(context)
                                      .productDetailsModel
                                      .data
                                      .image,
                                  name: ProductDetailsCubit.of(context)
                                      .productDetailsModel
                                      .data
                                      .name,
                                  price: ProductDetailsCubit.of(context)
                                      .productDetailsModel
                                      .data.price,
                                  id: ProductDetailsCubit.of(context)
                                      .productDetailsModel
                                      .data.id,
                                  description: ProductDetailsCubit.of(context)
                                      .productDetailsModel
                                      .data.description,
                                ),

                              ],
                            ),
                          ),
                          ProductDetailsTail(
                            id: ProductDetailsCubit.of(context)
                                .productDetailsModel
                                .data.id,
                            isFavourite: ProductDetailsCubit.of(context).productDetailsModel.data.inFavorites,
                          ),
                        ],
                      ),
              )),
        );
  }
}
