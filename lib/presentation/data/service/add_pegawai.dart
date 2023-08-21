import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddEmployeeProvider extends ChangeNotifier {
  TextEditingController nipContr = TextEditingController();
  TextEditingController namaContr = TextEditingController();
  TextEditingController emailContr = TextEditingController();

  String? _uid;
  String? get uid => _uid;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addEmployee() async {
    if (nipContr.text.isNotEmpty &&
        namaContr.text.isNotEmpty &&
        emailContr.text.isNotEmpty) {
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailContr.text,
          password: "password",
        );

        if (userCredential.user != null) {
          _uid = userCredential.user?.uid;
          await firestore.collection("pegawai").doc(uid).set({
            "nip": nipContr.text,
            "nama": namaContr.text,
            "email": emailContr.text,
            "uid": uid,
            "createdAt": DateTime.now().toIso8601String(),
          });

          ///mengirim email verifikasi
          await userCredential.user!.sendEmailVerification();
        }

        print(userCredential);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          SnackBar(
            action: SnackBarAction(
              label: "Error Message",
              onPressed: () {},
            ),
            content: const Text("Password yang digunakan terlalu singkat"),
            duration: const Duration(milliseconds: 3000),
          );
        } else if (error.code == 'email-already-in-use') {
          SnackBar(
            action: SnackBarAction(
              label: "Error Message",
              onPressed: () {},
            ),
            content: const Text("Email Sudah ada"),
            duration: const Duration(milliseconds: 3000),
          );
        }
      } catch (error) {
        SnackBar(
          action: SnackBarAction(
            label: "Error Message",
            onPressed: () {},
          ),
          content: const Text("Tidak dapat menambahkan pegawai"),
          duration: const Duration(milliseconds: 3000),
        );
      }
    } else {
      SnackBar(
        action: SnackBarAction(
          label: "Message",
          onPressed: () {},
        ),
        content: const Text("Semua Field Harus Di isi"),
        duration: const Duration(milliseconds: 3000),
      );
    }
  }
}
