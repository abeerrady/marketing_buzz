import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../locale_keys.dart';

class NotificationsSwitch extends StatefulWidget {
  @override
  _NotificationsSwitchState createState() => _NotificationsSwitchState();
}

class _NotificationsSwitchState extends State<NotificationsSwitch> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleKeys.Settings_Notifications.tr(),  style: TextStyle(
              fontSize: 20,
              color: Colors.black
          ),),
          CupertinoSwitch(
            activeColor: defaultColor,
            value: value,
            onChanged: (_value){
              setState(() {
                value= _value;
              });
            },
          )
        ],
      ),
    );
  }
}
