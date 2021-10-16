import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/cubits/cubits.dart';

class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = ViewCubit.get(context);
    return CurvedNavigationBar(
      // animationCurve: Curves.easeInSine,
      color:defaultColor,
      index: cubit.currentIndex,
      height: 50,
      backgroundColor: Colors.white,
      items: cubit.screens.map((e) => Icon(e[0] , size: 25, color: Colors.white,)).toList(),
      onTap: cubit.changeIndex,
    );




  }
}
