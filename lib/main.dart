import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import './screens/login_screen.dart';
import './screens/getting_started_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      builder: DevicePreview.appBuilder, // <--- /!
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
