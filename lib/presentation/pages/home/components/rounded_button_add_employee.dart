import 'package:flutter/material.dart';

import '../../../utilities/colors.dart';

class RoundedButtonAddEmployee extends StatelessWidget {
  const RoundedButtonAddEmployee({
    super.key,
    required this.onPress,
  });

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
        child: IconButton(
          onPressed: onPress,
          icon: const Icon(
            Icons.person_add,
            color: lightPurple,
          ),
        ),
      ),
    );
  }
}
