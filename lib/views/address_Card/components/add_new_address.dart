import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';

class AddAddressButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      height: 50,
      child: InkWell(
       // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressView(),)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 10,
              child: Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
              backgroundColor: defaultColor,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'ADD NEW ADDRESS',
              style:
              TextStyle(fontWeight: FontWeight.w700, color: defaultColor),
            )
          ],
        ),
      ),
    );
  }
}