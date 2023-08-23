import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_button.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_password_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/service/password_service.dart';
import '../../../../routes/name_routes.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController newPassController = TextEditingController();

    void showErrorSnackbar(String errorMessage) {
      final snackBar = SnackBar(
        content: Text(errorMessage),
        duration: const Duration(milliseconds: 3000),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void changePassword() async {
      final newpasswordService = PasswordService();
      final result =
          await newpasswordService.newPassword(newPassController.text);

      if (result == null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.home,
          (route) => false,
        );
      } else {
        showErrorSnackbar(result);
      }
    }

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
                    text: 'Masukan password baru untuk akun anda',
                    style: heading1(dark, semibold),
                    children: [
                      TextSpan(
                        text:
                            "\nKamu harus mengganti password default, untuk keamanan akun kamu.",
                        style: text2(grey, regular),
                      ),
                    ]),
              ),
            ),
            RoundedPasswordFiled(
              textHint: 'New Password',
              onChanged: (value) {},
              controller: newPassController,
            ),
            RoundedButton(
              onPress: () => changePassword(),
              backgroundColor: lightPurple,
              child: Text(
                "Simpan",
                style: text4(white, bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
