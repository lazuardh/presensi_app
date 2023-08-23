import 'package:flutter/material.dart';

/// class unntuk mengembalikan informasi hasil dari pengecekan apakah pengguna sudah mengganti password default atau belum
class RedirectInfo {
  final bool isRedirect;
  final Widget? redirectPage;

  RedirectInfo({required this.isRedirect, this.redirectPage});
}
