import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/add_address/view.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

import 'components/card_list.dart';
import 'components/your_address_text.dart';
import 'cubits/cubit.dart';

class AddressCardsView extends StatelessWidget {
  final bool isSelectable;

  const AddressCardsView({Key key, this.isSelectable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressController(isSelectable)..getAddress(),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: MyAppBar(text: 'Your Address'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add , color: Colors.white , size: 30,),
          backgroundColor: defaultColor,
            onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressView()));
            },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             // AddAddressButton(),
              // Spacer(),
              YourAddress(),
              CardsList(),
            ],
          ),
        ),
      ),
    );
  }
}