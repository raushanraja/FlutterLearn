import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  GetCurrentUser
  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  // Logout
  //  GetCurrentUser
  Future<bool> logout() async {
    await _auth.signOut();
    return true;
  }

  // Google Login
  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  // Login With Email
  Future<FirebaseUser> emailLogin(String email, String password) async {
    try {
      final AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user;
    } catch (e) {
      return null;
    }
  }

  // Registration
  Future<FirebaseUser> handleRegistration(
      String email, String password) async {
    final AuthResult authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User Email is " + authResult.user.email);
    return authResult.user;
  }
}
