import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/login/components/or_divider.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/already_have_account.dart';
import '../../../widgets/rounded_password_field.dart';
import '../../../widgets/rounded_text_field.dart';
import '../../welcome/components/rounded_button.dart';
import 'background.dart';
import 'soca_icon.dart';

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
            AlreadyHaveAccount(
              login: true,
              onPress: () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.register,
                (route) => false,
              ),
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SociaIcon(
                  onPress: () {},
                  socaIcon: "assets/icons/facebook.svg",
                ),
                SociaIcon(
                  socaIcon: "assets/icons/google-plus.svg",
                  onPress: () {},
                ),
                SociaIcon(
                  socaIcon: "assets/icons/twitter.svg",
                  onPress: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
