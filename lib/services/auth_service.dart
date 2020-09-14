import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();

  // register with mail and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // login with mail and pass
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("macarena");
      return null;
    }
  }

  // google sign in
  Future googleSignIn() async {
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      var result = await _auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // facebook sign in
  Future faceBookSignIn() async {
    try {
      final result = await _facebookLogin.logIn(['email']);
      final token = result.accessToken.token;
      if (result.status == FacebookLoginStatus.loggedIn) {
        final credential = FacebookAuthProvider.credential(token);
        var result = await _auth.signInWithCredential(credential);
        return result.user;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
