import 'package:flutter/material.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';

import '../view.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageAlertDialog extends StatefulWidget {


  @override
  _LanguageAlertDialogState createState() => _LanguageAlertDialogState();
}

class _LanguageAlertDialogState extends State<LanguageAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: AlertDialog(
        title: Center(child: Text("Languages")),
        backgroundColor: Colors.white,
        content: Container(
          height: 120,
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(onPressed: (){
                    // setState(() {
                    //   EasyLocalization.of(context).locale=Local('en','EN');
                    //   SharedHelper.setLanguage('en');
                    // });
                    context.setLocale(Locale('en'));
                  //  SharedHelper.setLanguage('en');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreens()));
                  }, child: Text('English' , style: TextStyle(fontSize: 22),))
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  TextButton(onPressed: (){
                    context.setLocale(Locale('ar'));
                  //  SharedHelper.setLanguage('ar');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreens()));
                  }, child: Text('Arabic' , style: TextStyle(fontSize: 22),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
