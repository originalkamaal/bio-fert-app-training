import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:learningdart/widgets/toast_widget.dart';
import 'package:learningdart/blocs/auth_bloc/auth_bloc.dart';

class AuthController {
  final BuildContext context;
  const AuthController({required this.context});

  void handleRegistration() async {
    try {
      final state = context.read<AuthBloc>().state;
      String phone = state.phone;
      print("${phone} is the phone nunber");
    } catch (e) {
      print(e);
    }
  }

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<AuthBloc>().state;
        String emailAddress = state.email;
        String userPassword = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "Please enter correct email address.");
          return;
        }
        if (userPassword.isEmpty) {
          toastInfo(msg: "Please check password.");
          return;
        }
        try {
          final creds = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress, password: userPassword);

          if (creds.user != null) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          } else if (creds.user == null) {
            toastInfo(msg: "Username or password is wrong");
            return;
          }
          if (!creds.user!.emailVerified) {
            print("not verified");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "User does not exist");
            return;
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Username or password is wrong");
            return;
          }
        }
      }
    } catch (e) {}
  }
}
