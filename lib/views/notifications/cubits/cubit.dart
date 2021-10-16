import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/notifications/cubits/states.dart';
import 'package:marketing_buzz/views/notifications/model/model.dart';

class NotificationCubit extends Cubit<NotificationsStates>{
  NotificationCubit() : super(NotificationInit());
  
  static NotificationCubit of(context) => BlocProvider.of(context);

  NotificationsModel notifications;

  Future<void> getNotification()async{
    emit(NotificationLoading());
    try{
      final resp = await Dio().get(baseUrl+'notifications');
      notifications = NotificationsModel.fromJson(resp.data);
    }catch(e){
      print(e.toString());
    }
    emit(NotificationInit());
  }
}