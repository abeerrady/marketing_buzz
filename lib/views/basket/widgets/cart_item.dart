import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/views/basket/cubits/get_cart_cubit.dart';

class CartItemView extends StatefulWidget {
  final String image;
  final String price;
  final bool isFavourite;
  final String name;
  final bool isDiscount;
  final String oldPrice;
  final int productId;
  final int cartId;
  final int index;
  final int quantity;
  final CartViewCubit cubit;

  const CartItemView(
      {Key key,
      this.image,
      this.price,
      this.isFavourite,
      this.name,
      this.isDiscount,
      this.oldPrice,
      this.productId,
      this.cartId,
      this.index,
      this.quantity,
      this.cubit})
      : super(key: key);

  @override
  _CartItemViewState createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  bool isFavourite;
  int counter = 1;
  @override
  void initState() {
    isFavourite = widget.isFavourite;
    counter = widget.quantity;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 130,
            height: 140,
            child: Image.network(
                widget.image),
          ),
          SizedBox(width: 20,),
          Expanded(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  showDialog(context: context, builder: (ctx)=>AlertDialog(
                    title: Center(child: Text("Remove this item?")),
                    backgroundColor: Colors.white,
                    content: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width-40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('Cancel' , style: TextStyle(color: Colors.black54 , fontSize: 22),)),
                          TextButton(onPressed: ()async{
                            Navigator.pop(context);
                           await widget.cubit.removeFromCard(widget.cartId);
                          }, child: Text('Remove' , style: TextStyle(color: Colors.black54 , fontSize: 22),)),

                        ],
                      ),
                    ),
                  ));
                }, icon: Icon(Icons.cancel_outlined , color: Colors.black54, size: 25)),

                Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
                Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                SizedBox(width: 30,),
                    IconButton(
                        onPressed: () {
                          if(counter>1){
                            setState(() {
                              counter--;
                            });
                            widget.cubit.updateCart(widget.cartId, counter);
                          }
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 30,
                          color: Colors.black45,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            '$counter',
                            style:
                            TextStyle(color: Colors.black45, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                          widget.cubit.updateCart(widget.cartId, counter);
                        },
                        icon: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black45,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
