import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/basket/cubits/cart_cubit.dart';
import 'package:marketing_buzz/views/favorite/cubits/cubit.dart';
import 'package:marketing_buzz/views/product_details/cubits/states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class ProductDetailsTail extends StatefulWidget {
  final int id;
  final bool isFavourite;

  const ProductDetailsTail({Key key, this.id, this.isFavourite}) : super(key: key);

  @override
  _ProductDetailsTailState createState() => _ProductDetailsTailState();
}

class _ProductDetailsTailState extends State<ProductDetailsTail> {
  bool isFavourite;

  @override
  void initState() {
    isFavourite = widget.isFavourite;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        )),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        FavoriteController().changeFavorite(widget.id);
                        print(widget.id);
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
                      icon: Icon(
                        Icons.favorite,
                        color:isFavourite?Colors.red: Colors.grey,
                      )),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: TextButton(
                  onPressed: () {
                    CartController().addCart(widget.id);
                  },
                  child: Text(
                    ' ADD TO CART',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
