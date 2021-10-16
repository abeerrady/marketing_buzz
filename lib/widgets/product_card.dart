import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/favorite/cubits/cubit.dart';
import 'package:marketing_buzz/views/product_details/view.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String price;
  final bool isFavourite;
  final String name;
  final bool isDiscount;
  final String oldPrice;
  final int productId;

  const ProductCard({
    Key key,
    this.image,
    this.price,
    this.isFavourite,
    this.name,
    this.isDiscount = false,
    this.oldPrice,
    this.productId,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavourite;

  @override
  void initState() {
    isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(widget.productId),
          )),
      child: GridTile(
        child: Image.network(
          widget.image,
          fit: BoxFit.cover,
        ),
        footer: Container(
          height: 35,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            leading: Text(
              widget.price,
              style: TextStyle(color: Colors.white),
            ),
            title: Text(
              widget.oldPrice,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white70,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              color:isFavourite? Colors.red: Colors.white,
              onPressed: () {
                FavoriteController().changeFavorite(widget.productId);
                print(widget.productId);
                setState(() {
                  isFavourite = !isFavourite;
                });
                Fluttertoast.showToast(
                    msg: isFavourite ? ' Item Added ' : ' Item Removed',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 20.0);
                print(SharedHelper.getToken);
              },
            ),
          ),
        ),
      ),
    );
  }
}
