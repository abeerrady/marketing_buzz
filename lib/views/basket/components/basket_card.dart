import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/basket/cubits/get_cart_cubit.dart';
import 'package:marketing_buzz/views/basket/cubits/get_cart_states.dart';
import 'package:marketing_buzz/views/basket/widgets/cart_item.dart';
import 'package:marketing_buzz/views/payment/view.dart';
import 'package:marketing_buzz/widgets/divider.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class BasketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = CartViewCubit.of(context);
    return BlocBuilder<CartViewCubit, GetCartStates>(
      bloc: cubit,
      builder: (context, state) => state is GetCartLoading
          ? cubit.addCartModel == null
              ? Center(child: Text('Loading ...'))
              : Center(
                  child: LoadingIndicator(),
                )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(

                          itemCount: cubit.addCartModel.data.cartItems.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            final cart = cubit
                                .addCartModel.data.cartItems[index].product;
                            return CartItemView(
                              index: index,
                              cubit: cubit,
                              cartId:
                                  cubit.addCartModel.data.cartItems[index].id,
                              quantity: cubit
                                  .addCartModel.data.cartItems[index].quantity,
                              productId: cart.id,
                              image: cart.image,
                              name: cart.name,
                              price: cart.price.toString(),
                              oldPrice: cart.oldPrice.toString(),
                              isFavourite: cart.inFavorites,
                              isDiscount: cart.discount == 0,
                            );
                          },
                          separatorBuilder: (context , index) => MyDivider(),

                          )),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              ' TOTAL',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              cubit.addCartModel.data.total.toString(),
                              style:
                                  TextStyle(color: defaultColor, fontSize: 25),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 180,
                            height: 45,
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: InkWell(
                              onTap: (){
                                MagicRouter.navigateTo(PaymentView());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' CHECKOUT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 22,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
