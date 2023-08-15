import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
    this.login = true,
    required this.onPress,
  });

  final bool login;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Tidak punya Account ? " : "Sudah punya Account ? ",
          style: text4(dark, regular),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            login ? "Register" : "Login",
            style: text4(darkPurple, bold),
          ),
        ),
      ],
    );
  }
}
