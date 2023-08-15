import 'package:flutter_application_1/presentation/pages/home/home_screen.dart';
import 'package:flutter_application_1/presentation/pages/login/login_screen.dart';
import 'package:flutter_application_1/presentation/pages/register/register_screen.dart';

import '../././/pages/Introduction/introduction_screen.dart';
import '../pages/welcome/welocme_screen.dart';
import '../routes/name_routes.dart';

class AppPage {
  static final pages = {
    RouteName.introductionScreen: (context) => const Introduction(),
    RouteName.welcome: (context) => const WelcomeScreen(),
    RouteName.login: (context) => const LoginScreen(),
    RouteName.register: (context) => const RegisterScreen(),
    RouteName.homeScreen: (context) => const HomeScreen(),
  };
}
