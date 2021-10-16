
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/authentication/login/view.dart';
import 'package:marketing_buzz/views/on_Boarding/widget/custom_page_view.dart';
import 'package:marketing_buzz/widgets/default_navigate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../locale_keys.dart';
import 'model/board_model.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: LocaleKeys.OnBoarding_BrowseOrderAllProductsAtAnyTime.tr(),
    ),
    BoardingModel(
      image: 'assets/images/onboard_2.jpg',
      title: LocaleKeys.OnBoarding_YourPackageInOurSafeHands.tr(),

    ),
    BoardingModel(
      image: 'assets/images/onboard_3.jpg',
      title: LocaleKeys.OnBoarding_HopeYouAreSatisfiedWithOurService.tr(),
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if (index == boarding.length-1) {

                    setState(() {
                      isLast = true;
                    });
                  } else {

                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context , index) => buildBoardingItem(boarding[index] , context),
                itemCount: boarding.length,
              ),
            ),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: defaultColor,
                dotHeight: 10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                TextButton(onPressed: (){
                 NavigateAndFinish(context, LoginView());
                }, child: Text(LocaleKeys.OnBoarding_Skip.tr() , style: TextStyle(color: Colors.grey , fontSize: 18),),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: (){
                  if(isLast) {
                    NavigateAndFinish(context, LoginView());
                  }else{
                    boardController.nextPage(duration: Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                  }
                }, child: Text(!isLast ? LocaleKeys.OnBoarding_Next.tr() : LocaleKeys.OnBoarding_Finish.tr() , style: TextStyle(fontSize: 20),))

              ],
            )
          ],
        ),
      )
    );
  }
}
