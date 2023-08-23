import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService extends ChangeNotifier {
  FirebaseAuth authenticate = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String errorMessage = "";

  bool? _isVerify;
  bool? get isVerify => _isVerify;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  bool? _isLogin;
  bool? get isLogin => _isLogin;

  String? _role;
  String? get role => _role;

  Future login(String email, String password) async {
    _isVerify = null;
    _isLoading = true;
    notifyListeners();

    if (email.isEmpty) {
      errorMessage = "email Tidak Boleh Kosong";
      return errorMessage;
    } else if (password.isEmpty) {
      errorMessage = "Pasword Tidak Boleh Kosong";
      return errorMessage;
    }

    try {
      UserCredential userCredential =
          await authenticate.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("isLogged $userCredential");

      if (userCredential.user != null) {
        _isVerify = userCredential.user?.emailVerified;
      }

      errorMessage = "";
      _isLoading = false;
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

  Future roleUser() async {
    final uid = authenticate.currentUser!.uid;

    final userData = await firestore.collection('pegawai').doc(uid).get();

    _role = userData.data()?['role'];
  }
}
