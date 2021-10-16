import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/on_Boarding/view.dart';
import 'package:marketing_buzz/views/view.dart';

import 'core/route/route.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
     supportedLocales: [Locale('en') , Locale('ar')],
      path: 'assets/langs',
      saveLocale: true,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Marketing Buzz',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
     home: SharedHelper.containsToken()? HomeScreens() : OnBoardingScreen(),
     );
  }
}

//1YESySIUOM64xbFQWibk3OpDizv34jQH0cOOM14Gn4G9kWhZ6pazst68abUYDry6rWOqyY

