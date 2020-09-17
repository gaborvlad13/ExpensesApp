import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:ExpensesApp/providers/auth_service.dart';
import 'package:ExpensesApp/screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './screens/login_screen.dart';
import './screens/getting_started_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/theme.dart';
import 'models/expense.dart';
import 'models/user_local.dart';

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
    return StreamProvider<UserLocal>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: theme(),
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        home: GetStartedScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          MainScreen.routeName: (context) => MainScreen(),
        },
      ),
    );
  }
}
