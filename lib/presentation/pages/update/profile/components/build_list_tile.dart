import 'package:flutter/material.dart';

import '../../../../utilities/colors.dart';
import '../../../../utilities/text_styles.dart';

class BuildListTileField extends StatelessWidget {
  const BuildListTileField(
      {super.key,
      required this.icon,
      required this.title,
      required this.child});

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: purple200,
        child: Icon(
          icon,
          color: white,
          size: 18.0,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: text4(Colors.grey, regular),
          ),
          child
        ],
      ),
    );
  }
}
