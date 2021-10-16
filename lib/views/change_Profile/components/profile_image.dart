import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/change_Profile/cubits/cubit.dart';

class ProfileImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileChangeCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder:(context , state)=> Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: cubit.file == null
                      ? NetworkImage(SharedHelper.getImage)
                      : FileImage(cubit.file),
                ),
                border: Border.all(color: Colors.grey)),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: Center(child: IconButton(onPressed: (){
              cubit.pickPhoto();
            }, icon: Icon(Icons.image , color: Colors.white,))),
          )
        ],
      ),
    );
  }
}
