import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:marketing_buzz/views/home/cubits/cubit.dart';
import 'package:marketing_buzz/widgets/product_card.dart';

import '../../../../locale_keys.dart';

class ProductsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
    return  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Home_Products.tr(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
             GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2/2.2,
                ),
                shrinkWrap: true,
                itemCount: cubit.responseData.data.products.length,
                itemBuilder: (BuildContext ctx, index) {
                final product = cubit.responseData.data.products[index];
                  return ProductCard(
                    image: product.image,
                    name: product.name,
                    isDiscount: product.discount==0,
                    oldPrice: product.oldPrice.toString(),
                    price: product.price.toString(),
                    isFavourite: product.inFavorites,
                    productId: product.id,
                  );
                }),
        ],
      );
  }
}
