import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileService extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentSnapshot? _userProfile;
  DocumentSnapshot? get userProfile => _userProfile;

  Future<DocumentSnapshot?> getDataUserProfile() async {
    String uid = auth.currentUser!.uid;

    _userProfile = await firestore.collection('pegawai').doc(uid).get();
    return _userProfile;
  }
}
