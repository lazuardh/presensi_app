import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'background.dart';
import 'rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WELCOME TO PRESENCE",
            style: text4(dark, bold),
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.45,
          ),
          RoundedButton(
            onPress: () => Navigator.pushNamed(
              context,
              RouteName.login,
            ),
            text: "LOGIN",
            backgroundColor: darkPurple,
            textColor: white,
          ),
          RoundedButton(
            onPress: () => Navigator.pushNamed(
              context,
              RouteName.register,
            ),
            text: "REGISTER",
            backgroundColor: lightGrey,
            textColor: dark,
          )
        ],
      ),
    );
  }
}
