

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/category/view.dart';
import 'package:marketing_buzz/views/favorite/viewe.dart';
import 'package:marketing_buzz/views/home/view.dart';
import 'package:marketing_buzz/views/setting/view.dart';


import 'states.dart';
class ViewCubit extends Cubit<ViewStates> {
  ViewCubit() : super(ViewInitialState());

  static ViewCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  final List<List<dynamic>> screens =[
    [Icons.home ,  HomeView(), 'Home'],
    [Icons.category , CategoryView(), 'Category'],
    [Icons.favorite, FavoriteView(),'Favorite'],
    [Icons.settings , SettingView(),'Settings'],
  ];
  void changeIndex(int value) {
    if (currentIndex==value) return;
    currentIndex = value;
    emit(ViewInitialState());
  }
  Widget get getCurrentView => screens[currentIndex][1];


  void x () {
    List<String> strings = ['0','1','2'];
    List<int> intgers = [];
    for(int i = 0; i < strings.length ; i++){
      intgers.add(int.parse(strings[i]));
    }
  }

}

/*
 List of T => List of S

 Empty List of S
 For
 addAll
 map
 T => Empty

 */