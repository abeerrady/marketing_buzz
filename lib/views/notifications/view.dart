import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/notifications/cubits/cubit.dart';
import 'package:marketing_buzz/views/notifications/cubits/states.dart';
import 'package:marketing_buzz/widgets/divider.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = NotificationCubit()..getNotification();
    return BlocProvider(
        create: (context) => cubit,
        child: Scaffold(
          appBar: MyAppBar(text: 'Notifications'),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) => state is NotificationLoading
                    ? LoadingIndicator()
                    : ListView.separated(
                      physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('12:00 am',
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 20),
                               ),
                               Text(
                                 cubit.notifications.data.data[index].title,
                                 maxLines: 3,
                                 overflow: TextOverflow.ellipsis,

                                 style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 20),
                               ),
                             ],
                           ),
                              Text(
                                cubit.notifications.data.data[index].message,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            MyDivider(),
                        itemCount: cubit.notifications.data.data.length),
              )),
        ));
  }
}
