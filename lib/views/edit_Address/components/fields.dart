import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

import '../cubit.dart';

class EditAddressFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final editAddressController = EditAddressController.of(context);
    return Form(
      key: EditAddressController.of(context).formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
         defaultFormField(
            label: 'Name',
            controller: editAddressController.nameController,
           prefix: Icons.person
          ),
         SizedBox(height: 15,),
         defaultFormField(
            label: 'City',
            controller: editAddressController.cityController,
           prefix: Icons.location_city
          ),
          SizedBox(height: 15,),
         defaultFormField(
            label: 'Region',
            prefix: Icons.location_on,
            controller: editAddressController.regionController,
          ),
          SizedBox(height: 15,),
         defaultFormField(
            label: 'Details',
            prefix: Icons.details,
            controller: editAddressController.detailsController,
          ),
          SizedBox(height: 15,),
         defaultFormField(
            label: 'Notes',
            prefix: Icons.note_add,
            controller: editAddressController.notesController,
          ),
        ],
      ),
    );
  }
}