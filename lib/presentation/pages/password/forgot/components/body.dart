import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../data/service/password_service.dart';
import '../../../../routes/name_routes.dart';
import '../../../../utilities/colors.dart';
import '../../../../utilities/text_styles.dart';
import '../../../../widgets/rounded_button.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();

  void showErrorSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(milliseconds: 3000),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void resetPassword() async {
    final resetPass = PasswordService();
    final result =
        await resetPass.forgotPasswordWithSendEmail(emailController.text);

    if (result == null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.login,
        (route) => false,
      );
    } else {
      showErrorSnackbar(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final passService = Provider.of<PasswordService>(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/Reset password.svg",
              height: size.height * 0.3,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: 'Masukan Email baru untuk akun anda',
                    style: heading1(dark, semibold),
                    children: [
                      TextSpan(
                        text:
                            "\nKami akan mengirimkan link ke email anda untuk melakukan reset password.",
                        style: text2(grey, regular),
                      ),
                    ]),
              ),
            ),
            RoundedTextField(
              hintText: "Your Email",
              onChanged: (value) {},
              icon: Icons.email,
              controller: emailController,
            ),
            RoundedButton(
              onPress: () => resetPassword(),
              backgroundColor: lightPurple,
              child: passService.isLoading == true
                  ? Text(
                      "PROCESS",
                      style: text4(white, bold),
                    )
                  : Text(
                      "SEND RESET PASSWORD",
                      style: text4(white, bold),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
