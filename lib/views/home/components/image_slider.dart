import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/home/cubits/cubit.dart';
import 'package:marketing_buzz/views/home/cubits/states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final banners = HomeCubit.of(context);
    return BlocBuilder(
      bloc: banners,
      builder: (context, state) => state is HomeLoadingState
          ? LoadingIndicator()
          : CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: .9,
                reverse: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlay: true,
              ),
              itemCount: banners.responseData.data.banners.length,
              itemBuilder: (context, index, rlIndex) => Container(
                color: Colors.white,
                width: 350,
                child: Image.network(
                  banners.responseData.data.banners[index].image,
                  height: 150,
                ),
              ),
            ),
    );
  }
}
