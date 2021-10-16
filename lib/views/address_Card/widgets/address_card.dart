import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/address_Card/cubits/cubit.dart';
import 'package:marketing_buzz/views/address_Card/model/model.dart';
import 'package:marketing_buzz/views/edit_Address/view.dart';
import 'package:marketing_buzz/views/payment/cubits/cubit.dart';

import '../view.dart';
import 'address_text_font.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final bool isSelectable;
  final bool isEditable;

  const AddressCard(
      {Key key,
        this.address,
        this.isSelectable = false,
        this.isEditable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey),
        ),
        height: MediaQuery.of(context).size.height / 3.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: address == null
              ? TextButton(
              onPressed: () async {
                final address =
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddressCardsView(
                    isSelectable: true,
                  ),
                ));
                if (address != null) {
                  CheckOutController.of(context).selectAddress(address);
                }
              },
              child: Text('Choose Address...' ,style: TextStyle(fontSize: 22),))
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isEditable)
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditAddressView(address: address),
                            ),
                          );
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: defaultColor,
                              fontSize: 20),
                        )),
                  IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: defaultColor,
                        size: 25,
                      ),
                      onPressed: () {
                        if (isEditable) {
                          AddressController.of(context)
                              .removeFromCards(address.id);
                        } else {
                          CheckOutController.of(context)
                              .selectAddress(null);
                        }
                      }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  AddressDetails(
                    title: address.city,
                  ),
                  AddressDetails(title: address.region),
                  AddressDetails(title: address.details),
                  AddressDetails(
                    title: address.notes,
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
              ),
              if (isSelectable)
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, address);
                    },
                    child: Text(
                      'SELECT THIS ADDRESS',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: defaultColor),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}