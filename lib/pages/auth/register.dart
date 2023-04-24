import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningdart/common/consts/colors.dart';
import 'package:learningdart/blocs/auth_bloc/auth_bloc.dart';
import 'package:learningdart/controllers/auth_controller.dart';
import 'package:learningdart/widgets/buttons_widgets.dart';
import 'package:learningdart/widgets/input_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  List<String> nameError = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          // resizeToAvoidBottomInset: true,
          appBar: buildAppBar("Create Account"),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 25.w, left: 25.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //label
                          reusableText("Mobile", 15.w),
                          //Mobile Input
                          buildTextInput(
                              placeHolder: "Enter 10 digit mobile Number",
                              inputType: "mobile",
                              iconName: "",
                              onChange: (value) => context
                                  .read<AuthBloc>()
                                  .add(RegisterMobileEvent(value))),
                          //Mobile Errors
                          inputErrorWidget(
                              error: state.passwordError,
                              visible:
                                  state.passwordError.isEmpty ? false : true),
                          reusableText("Email", 20.w),
                          buildTextInput(
                              placeHolder: "Enter your email address",
                              inputType: "email",
                              iconName: "user",
                              onChange: (value) => context
                                  .read<AuthBloc>()
                                  .add(RegisterEmailEvent(value))),
                          inputErrorWidget(
                              error: state.emailError,
                              visible: state.emailError.isEmpty ? false : true),

                          reusableText("Name", 20.w),
                          buildTextInput(
                            controller: controller,
                            placeHolder: "Enter your name",
                            inputType: "name",
                            iconName: "user",
                            onChange: (value) => {
                              context
                                  .read<AuthBloc>()
                                  .add(RegisterNameEvent(value)),
                            },
                          ),
                          inputErrorWidget(
                              error: nameError,
                              visible: state.nameError.isEmpty ? false : true),
                          reusableText("Password", 20.w),
                          buildPasswordInput(
                              "Enter password",
                              "lock",
                              (value) => {
                                    context
                                        .read<AuthBloc>()
                                        .add(LoginEmailEvent(value))
                                  }),
                          reusableText("Confirm Password", 20.w),
                          buildPasswordInput(
                              "Confirm Password",
                              "lock",
                              (value) => context
                                  .read<AuthBloc>()
                                  .add(LoginPasswordEvent(value))),
                          reusableText(
                              "By creating account, you are agree to our terms and conditions",
                              15.w),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (controller.value.text == "") {
                          setState(() {
                            nameError.add("Please enter name");
                          });
                        } else {
                          AuthController(context: context).handleRegistration();
                        }
                      } else {}
                    },
                    child: filledButton(
                        AppColors.primaryElement, "CREATE ACCOUNT"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
