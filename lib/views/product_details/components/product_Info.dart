import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/product_details/cubits/cubit.dart';
import 'package:marketing_buzz/views/product_details/cubits/states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class ProductDetailsInfo extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final int id;
  final String description;

  const ProductDetailsInfo(
      {Key key, this.image, this.name, this.price, this.id, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
      builder: (context, state) => state is ProductDetailsLoading
          ? Center(
              child: LoadingIndicator(),
            )
          : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Stack(alignment: AlignmentDirectional.bottomStart, children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.vertical,
                    autoPlay: true,
                  ),
                  items: [
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          image,
                        ),
                      ],
                    )
                  ],
                )
              ),
            ]),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                name,
                style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text('Price :', style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Text(
                      price.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 18 , fontWeight: FontWeight.bold),
                    ),
                    // decoration: BoxDecoration(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(
              'Description :',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ProductDetailsCubit.of(context)
                        .productDetailsModel
                        .data
                        .description,
                    style:
                    TextStyle(fontSize: 18, ),
                  ),
                ),
              ),
            ),
        ],
      ),
          ),
    );
  }
}
