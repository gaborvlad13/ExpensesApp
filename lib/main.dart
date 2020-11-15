import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:ExpensesApp/providers/auth_service.dart';
import 'package:ExpensesApp/screens/wrapper.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/theme.dart';
import 'models/user_local.dart';

import './providers/admob_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(
    appId: AddMobService().getAdMobAppId(),
  );
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocal>.value(
      initialData: UserLocal(uid: "loading"),
      value: AuthService().user,
      child: MaterialApp(
        theme: theme(),
        title: "Expenses App",
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          MainScreen.routeName: (context) => MainScreen(),
          Wrapper.routeName: (context) => Wrapper(),
        },
      ),
    );
  }
}
