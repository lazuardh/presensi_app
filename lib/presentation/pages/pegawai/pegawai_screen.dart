import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';

import 'components/body.dart';

class PegawaiScreen extends StatelessWidget {
  const PegawaiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context),
      body: const Body(),
    );
  }
}

PreferredSizeWidget titleBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      "ADD PEGAWAI",
      style: text2(dark, bold),
    ),
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios,
        color: dark,
      ),
    ),
  );
}
