import 'package:flutter/material.dart';

import '../../../../utilities/colors.dart';

class BuildContainerProfile extends StatelessWidget {
  const BuildContainerProfile({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
