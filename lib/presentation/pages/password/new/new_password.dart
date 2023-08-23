import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';

import 'components/body.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "PASSWORD BARU",
          style: heading1(dark, bold),
        ),
      ),
      body: const Body(),
    );
  }
}
