import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService extends ChangeNotifier {
  FirebaseAuth authenticate = FirebaseAuth.instance;
  String errorMessage = "";

  bool? _isVerify;
  bool? get isVerify => _isVerify;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future login(String email, String password) async {
    _isVerify = null;

    if (emailController.text.isEmpty) {
      errorMessage = "email Tidak Boleh Kosong";
      return errorMessage;
    } else if (passController.text.isEmpty) {
      errorMessage = "Pasword Tidak Boleh Kosong";
      return errorMessage;
    }

    try {
      UserCredential userCredential =
          await authenticate.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      print("isLogged $userCredential");

      if (userCredential.user != null) {
        _isVerify = userCredential.user?.emailVerified;
      }

      errorMessage = "";
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return errorMessage = "Email Tidak Terdaftar";
      } else if (error.code == 'wrong-password') {
        return errorMessage = "Password Salah";
      }

      return errorMessage = "Terjadi Kesalahan : ${error.message}";
    } catch (error) {
      print("erro kntl: $error");
      throw Exception(error);
    }
  }
}
