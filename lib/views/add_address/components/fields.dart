import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/views/add_address/cubit/cubit.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

class Fields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addAddressController = AddAddressController.of(context);
    return Form(
      key: AddAddressController.of(context).formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          defaultFormField(
            label: 'Name',
            prefix: Icons.person,
            controller: addAddressController.nameController,
          ),
          SizedBox(height: 15,),
          defaultFormField(
            label: 'City',
            prefix: Icons.location_city,
            controller: addAddressController.cityController,
          ),
          SizedBox(height: 15,),
          defaultFormField(
            label: 'Region',
            prefix: Icons.location_on,
            controller: addAddressController.regionController,
          ),
          SizedBox(height: 15,),
          defaultFormField(

            label: 'Details',
            prefix: Icons.details,
            controller: addAddressController.detailsController, type: null,
          ),
          SizedBox(height: 15,),
          defaultFormField(
            label: 'Notes',
            prefix: Icons.note_add,
            controller: addAddressController.notesController,
          ),
        ],
      ),
    );
  }
}