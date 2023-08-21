import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/data/service/authentication.dart';
import 'package:flutter_application_1/presentation/pages/login/components/or_divider.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../widgets/already_have_account.dart';
import '../../../widgets/rounded_button.dart';
import '../../../widgets/rounded_password_field.dart';
import '../../../widgets/rounded_text_field.dart';
import 'background.dart';
import 'soca_icon.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthenticationService>(context);

    void showErrorSnackbar(String errorMessage) {
      final snackBar = SnackBar(
        content: Text(errorMessage),
        duration: const Duration(milliseconds: 3000),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void showEmailNotVerifiedDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Email Not Verified"),
            content: const Text(
              "tolong Verifikasi Email kamu terlebiih dahulu untuk melanjutkan, cek email verifikasi pada akun yang di daftarkan.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }

    void handleLogin() async {
      String? errorMessage = await auth.login(
        auth.emailController.text,
        auth.passController.text,
      );

      if (errorMessage == null) {
        if (auth.isVerify == true) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.pegawai,
            (route) => false,
          );
        } else {
          showEmailNotVerifiedDialog(context);
        }
      } else {
        showErrorSnackbar(errorMessage);
      }
    }

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
              controller: auth.emailController,
              icon: Icons.person,
              hintText: 'Your Email',
              onChanged: (value) {},
            ),
            RoundedPasswordFiled(
              controller: auth.passController,
              textHint: 'Your Password',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              onPress: () => handleLogin(),
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
