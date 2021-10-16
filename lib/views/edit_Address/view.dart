import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/add_address/cubit/states.dart';
import 'package:marketing_buzz/views/address_Card/model/model.dart';
import 'package:marketing_buzz/widgets/main_button.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

import 'components/fields.dart';
import 'cubit.dart';

class EditAddressView extends StatelessWidget {
  final Address address;
  const EditAddressView({Key key, this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditAddressController(address),
      child: Scaffold(
        appBar:MyAppBar(text: 'Edit Address'),
        body: ListView(
          children: [
            EditAddressFields(),
            BlocBuilder<EditAddressController, AddAddressStates>(
              builder: (context, state) =>
                  MainButton(text: 'Save Changes', press: () {
                    EditAddressController.of(context).update(address.id);
                  }),
            )
          ],
        ),
      ),
    );
  }
}