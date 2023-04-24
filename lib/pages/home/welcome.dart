import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningdart/common/consts/colors.dart';
import 'package:learningdart/blocs/welcome_bloc/welcome_blocs.dart';
import 'package:learningdart/blocs/welcome_bloc/welcome_events.dart';
import 'package:learningdart/blocs/welcome_bloc/welcome_states.dart';
import 'package:learningdart/widgets/buttons_widgets.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomBloc, WelcomeState>(
        builder: (context, state) => SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomBloc>(context).add(WelcomeEvent());
                },
                controller: pageController,
                children: [
                  _page(
                      1,
                      context,
                      "NEXT",
                      "Keep Learning",
                      "Learning is always beneficial for life",
                      "assets/images/reading.png",
                      pageController),
                  _page(
                      2,
                      context,
                      "NEXT",
                      "Keep Sharing",
                      "Sharing is caring, care others",
                      "assets/images/boy.png",
                      pageController),
                  _page(
                      3,
                      context,
                      "GET STARTED",
                      "Learn with Others",
                      "A community always helps and boost learning.",
                      "assets/images/man.png",
                      pageController),
                ],
              ),
              Positioned(
                bottom: 15,
                child: DotsIndicator(
                  position: state.page.toDouble(),
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      color: AppColors.primaryThreeElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _page(int index, BuildContext context, String buttonName, String title,
    String subTitle, String imgPath, PageController pageController) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Center(
            child: Image.asset(
          imgPath,
          fit: BoxFit.cover,
        )),
      ),
      Text(
        title,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24.sp,
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal),
      ),
      Text(
        subTitle,
        style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primarySecondaryElementText,
            fontWeight: FontWeight.normal),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          } else {
            final user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/signin', (route) => false);
            }
          }
        },
        child: filledButton(AppColors.primaryElement, buttonName),
      )
    ],
  );
}
