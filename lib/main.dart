import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningdart/bloc_providers.dart';
import 'package:learningdart/firebase_options.dart';
import 'package:learningdart/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
              fontFamily: "Montserrat",
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  centerTitle: true,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent))),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: MyRoutes.generateRoutes,
        ),
      ),
    );
  }
}


// MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: const Scaffold(),
      
//     );