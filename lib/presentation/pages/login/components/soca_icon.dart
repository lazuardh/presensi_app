import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/colors.dart';

class SociaIcon extends StatelessWidget {
  const SociaIcon({
    super.key,
    required this.socaIcon,
    required this.onPress,
  });

  final String socaIcon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              color: white,
              width: 2,
            ),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          socaIcon,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
