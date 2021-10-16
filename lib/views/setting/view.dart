import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/custom_list.dart';
import 'package:marketing_buzz/widgets/divider.dart';
import '../../../locale_keys.dart';
import 'components/notification_switch.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomListDetails(
            text: LocaleKeys.Settings_AccountInfo.tr(),
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomListDetails(
              text: LocaleKeys.Settings_ChangeEmail.tr(),
              color: Colors.black,
            ),
          ),
          CustomListDetails(
            text: LocaleKeys.Settings_ChangePassword.tr(),
            color: Colors.black,
          ),
          NotificationsSwitch(),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyDivider(),
              Text(
                LocaleKeys.Settings_LogOut.tr(),
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
