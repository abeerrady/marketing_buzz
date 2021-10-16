import 'package:flutter/material.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:marketing_buzz/views/change_Profile/view.dart';
import 'package:marketing_buzz/views/drawer/your_orders.dart';
import 'package:marketing_buzz/views/language/components/language_screen.dart';
import 'package:marketing_buzz/views/language/view.dart';
import 'package:marketing_buzz/views/notifications/view.dart';
import '../../../locale_keys.dart';
import '../view.dart';
import '../about_Us/view.dart';
import '../basket/view.dart';
import 'components/custom_list_tile.dart';
import '../get_Help/view.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _index = 0;

  List pages = [
    HomeScreens(),
    LanguageScreen(),
    OrdersScreen(),
    BasketView(),
    NotificationsView(),
    HelpScreen(),
    AboutUsScreen(),
  ];
  List items = [
    CustomListTile(
      text: LocaleKeys.Drawer_Home.tr(),
      icon: Icons.home,
    ),
    CustomListTile(
      text: LocaleKeys.Drawer_Language.tr(),
      icon: Icons.language_outlined,
    ),
    CustomListTile(
      text: LocaleKeys.Drawer_YourOrder.tr(),
      icon: Icons.assignment,
    ),
    CustomListTile(
      text: LocaleKeys.Drawer_Basket.tr(),
      icon: Icons.shopping_basket_outlined,
    ),
    CustomListTile(
      text: 'Notifications',
      icon: Icons.notifications,
    ),
    CustomListTile(
      text: LocaleKeys.Drawer_GetHelp.tr(),
      icon: Icons.help,
    ),
    CustomListTile(
      text: LocaleKeys.Drawer_AboutUs.tr(),
      icon: Icons.verified_user,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  MagicRouter.navigateTo(ChangeProfileView());
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  )),
                ),
              ),
              Column(
                children: [
                  Text(
                    LocaleKeys.Drawer_HiAbeer.tr(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    LocaleKeys.Drawer_Egypt.tr(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      width: 7,
                      height: 30,
                      decoration: BoxDecoration(
                        color:
                            _index == index ? defaultColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      child: items[index],
                      onTap: () {
                        if (index == 1) {
                          showDialog(context: context, builder: (ctx)=>LanguageAlertDialog());
                        } else {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pages[index]));
                        }

                        _index = index;
                        setState(() {}); // _onSelected(index);
                      },
                    ))
                  ],
                );
              })
        ],
      ),
    );
  }
}
