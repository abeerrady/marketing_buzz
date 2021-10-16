import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/about_Us/cubits/cubit.dart';
import 'package:marketing_buzz/views/about_Us/cubits/states.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';
import 'package:marketing_buzz/widgets/my_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = FaqsCubit()..getFaqs();
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: MyAppBar(text: 'About Us'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) => state is FaqsLoading
                ? LoadingIndicator()
                : ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              border: Border.all(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(5)),
                          child: ExpansionTile(
                            iconColor: defaultColor,
                            textColor: Colors.black,
                            title: Text(cubit.faqsModel.data.data[index].question),
                            children: [
                              ListTile(title: Text(cubit.faqsModel.data.data[index].answer)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    itemCount: cubit.faqsModel.data.data.length,
                  ),
          ),
        ),
      ),
    );
  }
}
