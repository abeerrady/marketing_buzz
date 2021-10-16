import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/address_Card/view.dart';
import 'package:marketing_buzz/widgets/main_button.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

import 'components/fields.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AddAddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressController(),
      child: Scaffold(
        appBar: MyAppBar(text: 'Add New Address'),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Fields(),
            BlocBuilder<AddAddressController, AddAddressStates>(
                builder: (context, state) => MainButton(
                    text: 'Save',
                    press: () async {
                      final message =
                      await AddAddressController.of(context).addAddress();
                      if (message != 'ok') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Your Address Added Successfully')));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressCardsView(),
                            ));
                      }
                    }))
          ],
        ),
      ),
    );
  }
}