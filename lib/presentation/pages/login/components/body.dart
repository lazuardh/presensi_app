import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../welcome/components/rounded_button.dart';
import 'background.dart';
import 'rounded_password_field.dart';
import 'rounded_text_field.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: text1(dark, bold),
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            RoundedTextField(
              hintText: 'Your Email',
              onChanged: (value) {},
            ),
            RoundedPasswordFiled(
              textHint: 'Your Password',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              onPress: () {},
              backgroundColor: darkPurple,
              textColor: white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tidak punya Account ? ",
                  style: text4(dark, regular),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteName.register,
                  ),
                  child: Text(
                    "Register",
                    style: text4(darkPurple, bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
