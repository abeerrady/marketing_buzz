import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/views/favorite/cubits/cubit.dart';
import 'package:marketing_buzz/views/favorite/cubits/get_cubit.dart';
import 'package:marketing_buzz/views/product_details/view.dart';

class FavourItem extends StatefulWidget {
  final String image;
  final String price;
  final bool isFavourite;
  final String name;
  final bool isDiscount;
  final String oldPrice;
  final int productId;
  final int id;
  final int index;

  const FavourItem(
      {Key key,
        this.image,
        this.price,
        this.isFavourite,
        this.name,
        this.isDiscount = false,
        this.oldPrice,
        this.productId,
        this.id,
        this.index})
      : super(key: key);

  @override
  _FavourItemState createState() => _FavourItemState();
}

class _FavourItemState extends State<FavourItem> {
  bool isFavourite;

  @override
  void initState() {
    isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: (){
      //   MagicRouter.navigateTo(ProductDetails(widget.id));
      // },
      child: Row(
        children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            // if(HomeController.of(context).favoriteModel.data.product.discount!=0)
            Container(
              child: Image.network(
                widget.image,
              ),
              width: 100,
            ),
            Container(
              child: Text(
                'Discount',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            )
          ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(color: Colors.red[900]),
                      ),
                      // if (widget.isDiscount)
                      Text(
                        widget.oldPrice,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                      IconButton(
                        icon: CircleAvatar(
                            child: Icon(
                              Icons.favorite_border,
                              size: 20,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.red
                          // isFavourite ? Colors.red : Colors.grey[500],
                          // Colors.grey[500],
                          // maxRadius: 14,
                        ),
                        onPressed: () async {
                          FavoriteController().changeFavorite(widget.productId);
                          await GetFavoriteController.of(context)
                              .removeFromFavourite(widget.index);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}