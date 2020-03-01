import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_flow/database/database.dart';

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

  Future<bool> googleout() async {
      await _googleSignIn?.disconnect();
      await _googleSignIn.signOut();
      await _auth.signOut();
      return true;
    }
  

  // Google Login
  Future<FirebaseUser> handleSignIn() async {
    GoogleSignInAccount googleUser;
    try {
      googleUser = await _googleSignIn.signIn();
    } catch (e) {
      googleUser = null;
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

    final AuthResult authResult = googleUser == null
        ? null
        : await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult?.user;
    print(user);
    return user;
  }

  // Login With Email
  Future<Map<String, dynamic>> emailLogin(String email, String password) async {
    try {
      final AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var documnet =authResult.user!=null? await DataService(UID: authResult.user.uid).getUsetInfo():null;
      print(documnet?.data['name']);
      return {"user": authResult.user, "error": null,"name":documnet!=null?documnet.data['name']:null};
    } catch (e) {
      print(e);
      List errorList = e.code.toString().split("_");
      return {
        "user": null,
        "error": errorList.sublist(1).join(" ").toLowerCase()
      };
    }
  }

  // Registration
  Future<Map<String, dynamic>> handleRegistration(
      String email, String password, String name) async {
    try {
      final AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User Email is " + authResult.user.email);
      await DataService(UID: authResult.user.uid).updateUserData(name, email);
      return {"user": authResult.user, "error": null};
    } catch (e) {
      print(e);
      List errorList = e.code.toString().split("_");
      return {
        "user": null,
        "error": errorList.sublist(1).join(" ").toLowerCase()
      };
    }
  }
}
