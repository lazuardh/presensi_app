import 'package:flutter/material.dart';

import '../../../utilities/colors.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
