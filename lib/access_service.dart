import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class accessServices extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  User? currentUser;
  bool loading = false;

  void showLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<bool> registerUsingEmailPassword({
    required String email,
    required String pword,
    required void Function(String message) showSnackbar,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pword,
      );
      currentUser = userCredential.user;
      showSnackbar("Berhasil Register");
      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar('The password provided is too weak.');
        // return SignInSignUpResult(message: "password to weak");
      } else if (e.code == 'email-already-in-use') {
        showSnackbar('The account already exists for that email.');
        // return SignInSignUpResult(message: "email already use");
      }
      return false;
    } catch (e) {
      showSnackbar("Error Happened");
      return false;
    }
  }

  Future<bool> signInUsingEmailPassword({
    required String email,
    required String pword,
    required void Function(String message) showSnackbar,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pword,
      );
      currentUser = userCredential.user;
      showSnackbar("Berhasil Login");
      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showSnackbar("Wrong password provided.");
      }
      return false;
    }
  }

  void logout() async {
    await _firebaseAuth.signOut();
    currentUser = null;
    notifyListeners();
  }

  // static Future<User?> refreshUser(User user) async {
  //   FirebaseAuth akun = FirebaseAuth.instance;

  //   await user.reload();
  //   User? refreshedUser = akun.currentUser;

  //   return refreshedUser;
  // }

  // static Future<void> signOut() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   try {
  //     await FirebaseAuth.instance.signOut();
  //   } catch (e) {
  //     print("gagal");
  //   }
  // }
}
