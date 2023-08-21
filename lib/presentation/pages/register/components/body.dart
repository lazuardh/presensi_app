import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:flutter_application_1/presentation/widgets/already_have_account.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_button.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_password_field.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'background.dart';

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
            "REGISTER",
            style: text1(dark, bold),
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.35,
          ),
          RoundedTextField(
            controller: TextEditingController(),
            icon: Icons.person,
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordFiled(
            controller: TextEditingController(),
            textHint: "Password",
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "REGISTER",
            onPress: () {},
            backgroundColor: darkPurple,
            textColor: white,
          ),
          AlreadyHaveAccount(
            login: false,
            onPress: () => Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.login,
              (route) => false,
            ),
          )
        ],
      ),
    );
  }
}
