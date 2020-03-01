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
     GoogleSignInAccount googleUser;
    try {
       googleUser = await _googleSignIn.signIn();
    } catch (e) {
      googleUser=null;
    }
print(googleUser);
    final GoogleSignInAuthentication googleAuth =
        await googleUser?.authentication;

print(googleAuth);

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

print(credential);

    final AuthResult authResult =  googleUser==null?null : await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult?.user;
print(user);

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
