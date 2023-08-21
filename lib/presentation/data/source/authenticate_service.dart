import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateService {
  FirebaseAuth authenticate = FirebaseAuth.instance;

  Future signWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await authenticate.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("isLogged $userCredential");
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw Exception('Email belum Terdaftar');
      } else if (error.code == 'wrong-password') {
        throw Exception('Password salah');
      }
    }
  }
}
