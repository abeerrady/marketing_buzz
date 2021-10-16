import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/custom_list.dart';
import 'package:marketing_buzz/widgets/divider.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

class HelpScreen extends StatelessWidget {
List getHelp =[
  CustomListDetails(
    text: 'I need help with a current order',
    color: Colors.grey[800],
  ),
  CustomListDetails(
    text: 'I need help with a previous order',
    color: Colors.grey[800],
  ),
  CustomListDetails(
    text: 'I have a partner question',
    color: Colors.grey[800],
  ),
  CustomListDetails(
    text: 'COVID_19 questions',
    color: Colors.grey[800],
  ),
  CustomListDetails(
    text: 'Subscriptions and billing',
    color: Colors.grey[800],
  ),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: 'Help'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text('Hi, Abeer Mohamed! How can we help? ' , style: TextStyle(
              color: Colors.black , fontSize: 25 , fontWeight: FontWeight.w600
            ),),
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: ListView.builder(
               physics: BouncingScrollPhysics(),
               shrinkWrap: true,
               itemCount: getHelp.length,
               itemBuilder: (context , index)=>Column(
                 children: [
                   getHelp[index],
                   MyDivider(),
                 ],
               ),),
           )
          ],
        ),
      ),
    );
  }
}
