import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceSocial with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

      return null;
    }
  }

}
