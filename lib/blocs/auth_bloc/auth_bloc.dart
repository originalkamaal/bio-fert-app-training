import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEmailEvent>(_loginEmailEvent);
    on<LoginPasswordEvent>(_loginPasswordEvent);
    on<RegisterMobileEvent>(_registerMobileEvent);
    on<RegisterEmailEvent>(_registerEmailEvent);
    on<RegisterNameEvent>(_registerNameEvent);
  }

  void _loginEmailEvent(LoginEmailEvent event, Emitter<AuthState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _loginPasswordEvent(LoginPasswordEvent event, Emitter<AuthState> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _registerMobileEvent(
      RegisterMobileEvent event, Emitter<AuthState> emit) {
    List<String> error = [];
    if (event.number.length != 10) {
      error.add("Mobile number not correct");
    }
    emit(state.copyWith(mobile: event.number, passwordError: error));
  }

  void _registerEmailEvent(RegisterEmailEvent event, Emitter<AuthState> emit) {
    List<String> error = [];
    if (!EmailValidator.validate(event.email)) {
      error.add("Please enter valid email");
    }
    emit(state.copyWith(email: event.email, emailError: error));
  }

  void _registerNameEvent(RegisterNameEvent event, Emitter<AuthState> emit) {
    List<String> error = [];
    if (event.name.isEmpty) {
      error.add("Enter your name");
    }
    emit(state.copyWith(name: event.name, nameError: error));
  }
}
