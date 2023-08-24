import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileService extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentSnapshot? _userProfile;
  DocumentSnapshot? get userProfile => _userProfile;

  String message = '';

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  Future<DocumentSnapshot?> getDataUserProfile() async {
    String uid = auth.currentUser!.uid;

    _userProfile = await firestore.collection('pegawai').doc(uid).get();
    return _userProfile;
  }

  Future updateProfile(String nama, String alamat) async {
    _isLoading = true;
    notifyListeners();

    if (nama.isEmpty) {
      message = "nama tidak boleh kosong";
      return message;
    } else if (alamat.isEmpty) {
      message = "alamat tidak boleh kosong";
      return message;
    }
    try {
      String uid = auth.currentUser!.uid;

      if (nama.isNotEmpty && alamat.isNotEmpty) {
        await firestore.collection('pegawai').doc(uid).update({
          "nama": nama,
          "alamat": alamat,
        });
      }

      _isLoading = false;
      message = "berhasil Update profile";
      notifyListeners();
      return message;
    } catch (e) {
      return message = "tidak dapat update profile";
    }
  }
}
