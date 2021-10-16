import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';
import 'components/fields.dart';
import 'components/profile_image.dart';
import 'cubits/cubit.dart';
import 'cubits/states.dart';

class ChangeProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ProfileChangeCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor,
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            BlocBuilder<ProfileChangeCubit , ProfileChangeStates>(
              builder:(context , state)=> state is ProfileChangeLoading ? LoadingIndicator(): TextButton(
                onPressed: () {
                  ProfileChangeCubit.of(context).changeProfile();

                },
                child: Text(
                  'save edits',
                  style: TextStyle(fontSize: 24, color: Colors.white60),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30 , left: 20 , right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(),
                  Fields(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
