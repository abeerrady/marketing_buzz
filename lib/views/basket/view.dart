import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/basket/cubits/get_cart_cubit.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';
import 'components/basket_card.dart';

class BasketView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CartViewCubit()..getCart(),
      child: Scaffold(
        appBar: MyAppBar(text: 'Basket'),
        body:BasketCard()
      ),
    );
  }
}
