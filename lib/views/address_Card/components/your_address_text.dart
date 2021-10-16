import 'package:flutter/material.dart';

class YourAddress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'YOUR ADDRESSES:',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}