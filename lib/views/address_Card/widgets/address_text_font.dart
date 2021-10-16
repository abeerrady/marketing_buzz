import 'package:flutter/material.dart';

class AddressDetails extends StatelessWidget {
  final String title;

  const AddressDetails({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey[600],
      ),
    );
  }
}