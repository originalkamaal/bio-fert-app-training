import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningdart/blocs/home_bloc/home_bloc.dart';
import 'package:learningdart/blocs/auth_bloc/auth_bloc.dart';
import 'package:learningdart/blocs/welcome_bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ];
}
