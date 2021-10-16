
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

class OrdersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: 'Your Order')
    );
  }
}
