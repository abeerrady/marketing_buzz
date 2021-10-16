import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/components/sign_up_form_feild.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/components/sign_up_header.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/cubits/cubit.dart';


class SignUpView extends StatelessWidget {
 // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SignUpCubit(),
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/blue.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: SignUpHeader(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3+10 ,
                left: 30,
                right: 30,
                //bottom: 30,
                child: Container(
                  width: 250,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SignUpFormsField(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}