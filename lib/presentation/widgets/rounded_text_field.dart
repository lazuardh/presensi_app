import 'package:flutter/material.dart';

import '../pages/login/components/text_filed_container.dart';
import '../utilities/colors.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.icon,
    required this.controller,
  });

  final String hintText;
  final IconData icon;
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
          hintText: hintText,
          icon: Icon(
            icon,
            color: darkPurple,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
