import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/favorite/components/favorite_item.dart';
import 'package:marketing_buzz/views/favorite/cubits/get_states.dart';
import 'package:marketing_buzz/widgets/divider.dart';



import 'cubits/get_cubit.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFavoriteController()..getFavorite(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetFavoriteController, AddFavoriteStates>(
          builder: (context, state) =>
              GetFavoriteController.of(context).addFavModel == null
                  ? Text(' No Item ')
                  : ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: GetFavoriteController.of(context)
                          .addFavModel
                          .data
                          .data
                          .length,
                      separatorBuilder: (context, index) => MyDivider(),
                      padding: EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        final addFav = GetFavoriteController.of(context)
                            .addFavModel
                            .data
                            .data[index]
                            .product;

                        return FavourItem(
                          name:  addFav.name,
                          image: addFav.image,
                          isDiscount: addFav.discount==0,
                          oldPrice: addFav.oldPrice.toString(),
                          price: addFav.price.toString(),
                          productId: addFav.id,
                          index: index,
                        );
                      }),
        ),
      ),
    );
  }
}
