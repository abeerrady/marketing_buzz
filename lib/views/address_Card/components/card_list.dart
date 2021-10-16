import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/address_Card/cubits/cubit.dart';
import 'package:marketing_buzz/views/address_Card/cubits/states.dart';
import 'package:marketing_buzz/views/address_Card/widgets/address_card.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

class CardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AddressController, AddressStates>(
        builder: (context, state) => state is AddressLoading
            ? AddressController.of(context).getAddressModel == null
            ? Text('No Result')
            : Center(child: LoadingIndicator())
            : RefreshIndicator(
          onRefresh: AddressController.of(context).getAddress,
          child: ListView.builder(
            itemBuilder: (context, index) {
              final cubit = AddressController.of(context)
                  .getAddressModel
                  .data
                  .address[index];
              return AddressCard(
                address: cubit,
                isSelectable: AddressController.of(context).isSelectable,
              );
            },
            itemCount:AddressController.of(context)
                .getAddressModel
                .data
                .address
                .length,
          ),
        ),
      ),
    );
  }
}