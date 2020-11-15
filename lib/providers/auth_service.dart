import 'package:ExpensesApp/models/user_local.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserLocal _userFromFirebaseUser(User user) {
    return user != null ? UserLocal(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserLocal> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // register with mail and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  // login with mail and pass
  Future loginWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
