import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/search/view.dart';

import 'package:marketing_buzz/widgets/default_navigate.dart';

import 'cubits/cubits.dart';
import 'cubits/states.dart';
import 'drawer/view.dart';
import 'nav_Bar/nav_bar.dart';


class HomeScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ViewCubit(),
      child: BlocBuilder<ViewCubit , ViewStates>(
        builder: (context , state) => Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            centerTitle: true,
            title: Text('Marketing Buzz' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                MagicRouter.navigateTo(SearchView());
              }, icon: Icon(Icons.search , color: Colors.white,))
            ],
          ),
          drawer: Drawer(
            child: CustomDrawer(),
          ),
          bottomNavigationBar: NavBarView(),
          body: ViewCubit.get(context).getCurrentView,
        ),
      )
    );
  }
}
