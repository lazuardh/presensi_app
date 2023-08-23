import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordService extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  String message = "";

  String? _email;
  String? get email => _email;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  Future newPassword(String newPasswordValue) async {
    if (newPasswordValue.isNotEmpty) {
      if (newPasswordValue != "password") {
        try {
          await auth.currentUser!.updatePassword(newPasswordValue);

          _email = auth.currentUser!.email;

          await auth.signOut();

          await auth.signInWithEmailAndPassword(
            email: _email!,
            password: newPasswordValue,
          );

          message = "";
          notifyListeners();
          return null;
        } on FirebaseAuthException catch (error) {
          if (error.code == 'weak-password') {
            return message = "Password terlalu lemah, minimal 6 karakter ";
          }
        } catch (error) {
          return message =
              "Tidak dapat membuat password baru. Hubungi admin segera.";
        }
      } else {
        return message =
            "password baru harus diubah, tolong jangan gunakan password kembali";
      }
    } else {
      return message = "Password baru wajib di isi";
    }
  }

  Future forgotPasswordWithSendEmail(String newEmail) async {
    if (newEmail.isNotEmpty) {
      _isLoading = true;
      notifyListeners();
    } else {
      return message =
          "tidak dapat mengirimkan link reset password, field harus di isi";
    }
    try {
      await auth.sendPasswordResetEmail(email: newEmail);

      _isLoading = true;
      notifyListeners();
      return message =
          "Kami telah mengirimkan link reset password pada email anda.";
    } on FirebaseAuthException catch (error) {
      return message = "$error";
    } catch (error) {
      return message = "tidak dapa mengirimkan link reset password";
    } finally {
      _isLoading = false;
      message = "";
      notifyListeners();
    }
  }
}
