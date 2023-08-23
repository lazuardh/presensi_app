import 'package:flutter_application_1/presentation/pages/home/home_screen.dart';
import 'package:flutter_application_1/presentation/pages/login/login_screen.dart';
import 'package:flutter_application_1/presentation/pages/navigation/navigation_Screen.dart';
import 'package:flutter_application_1/presentation/pages/password/forgot/forgot_password.dart';
import 'package:flutter_application_1/presentation/pages/password/new/new_password.dart';
import 'package:flutter_application_1/presentation/pages/pegawai/pegawai_screen.dart';
import 'package:flutter_application_1/presentation/pages/register/register_screen.dart';

import '../pages/welcome/welocme_screen.dart';
import '../routes/name_routes.dart';

class AppPage {
  static final pages = {
    // RouteName.introductionScreen: (context) => const Introduction(),
    RouteName.welcome: (context) => const WelcomeScreen(),
    RouteName.login: (context) => const LoginScreen(),
    RouteName.register: (context) => const RegisterScreen(),
    RouteName.newPassword: (context) => const NewPassword(),
    RouteName.forgotPassword: (context) => const ForgotPassword(),
    RouteName.navigation: (context) => const NavigationScreen(),
    RouteName.pegawai: (context) => const PegawaiScreen(),
    RouteName.home: (context) => const HomeScreen(),
  };
}
