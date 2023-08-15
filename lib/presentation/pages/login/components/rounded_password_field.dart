import 'package:flutter/material.dart';

import '../../../utilities/colors.dart';
import 'text_filed_container.dart';

class RoundedPasswordFiled extends StatelessWidget {
  const RoundedPasswordFiled({
    super.key,
    required this.textHint,
    required this.onChanged,
  });

  final String textHint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
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
