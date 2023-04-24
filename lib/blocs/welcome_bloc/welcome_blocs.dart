import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningdart/blocs/welcome_bloc/welcome_events.dart';
import 'package:learningdart/blocs/welcome_bloc/welcome_states.dart';

class WelcomBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
