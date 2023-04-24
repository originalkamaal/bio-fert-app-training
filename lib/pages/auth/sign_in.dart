import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningdart/common/consts/colors.dart';
import 'package:learningdart/blocs/auth_bloc/auth_bloc.dart';
import 'package:learningdart/controllers/auth_controller.dart';
import 'package:learningdart/widgets/buttons_widgets.dart';
import 'package:learningdart/widgets/input_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          // resizeToAvoidBottomInset: true,
          //appBar: buildAppBar(),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Center(
                            //   child: Image.asset(
                            //     "assets/images/ic_launcher.png",
                            //     width: 90.w,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20.w,
                            // ),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/register');
                                    },
                                    child: Text(
                                      "Create Account",
                                      style: TextStyle(
                                        color: AppColors.primaryElement,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      padding:
                          EdgeInsets.only(right: 25.w, left: 25.w, top: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email", 20.w),
                          buildTextInput(
                              placeHolder: "Enter your email address",
                              inputType: "email",
                              iconName: "user",
                              onChange: (value) => context
                                  .read<AuthBloc>()
                                  .add(LoginEmailEvent(value))),
                          reusableText("Password", 20.w),
                          buildTextInput(
                              placeHolder: "Enter Password",
                              inputType: "password",
                              iconName: "lock",
                              onChange: (value) => context
                                  .read<AuthBloc>()
                                  .add(LoginPasswordEvent(value))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 25.w, top: 10.w),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgotPass');
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: AppColors.primaryText,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryText,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthController(context: context).handleSignIn("email");
                      },
                      child: filledButton(AppColors.primaryElement, "LOGIN"),
                    ),
                    Center(
                      child: reusableText("Or", 20.w),
                    ),
                    buildThirdPartyLogin(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
