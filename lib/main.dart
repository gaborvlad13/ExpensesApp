import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/login_screen.dart';
import './screens/getting_started_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp( 
      theme: theme(),
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        MainScreen.routeName: (context) => MainScreen(),
      },
    );
  }
}
