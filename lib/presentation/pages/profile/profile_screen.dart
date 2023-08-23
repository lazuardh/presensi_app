import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: const Body(),
    );
  }
}

PreferredSizeWidget titleBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      "PROFILE",
      style: text2(dark, bold),
    ),
  );
}
