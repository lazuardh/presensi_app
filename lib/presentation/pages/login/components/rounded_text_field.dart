import 'package:flutter/material.dart';

import '../../../utilities/colors.dart';
import 'text_filed_container.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: false,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: const Icon(
            Icons.person,
            color: darkPurple,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
