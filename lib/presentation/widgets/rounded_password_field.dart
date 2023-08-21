import 'package:flutter/material.dart';

import '../pages/login/components/text_filed_container.dart';
import '../utilities/colors.dart';

class RoundedPasswordFiled extends StatelessWidget {
  const RoundedPasswordFiled({
    super.key,
    required this.textHint,
    required this.onChanged,
    required this.controller,
  });

  final String textHint;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: false,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: textHint,
          icon: const Icon(
            Icons.lock,
            color: darkPurple,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: darkPurple,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
