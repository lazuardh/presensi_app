import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OR",
              style: text4(dark, bold),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }
}

Expanded buildDivider() {
  return const Expanded(
    child: Divider(
      color: dark,
      height: 1.5,
    ),
  );
}
