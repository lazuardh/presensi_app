import 'package:flutter_application_1/presentation/pages/home/home_screen.dart';

import '../././/pages/Introduction/introduction_screen.dart';
import '../routes/name_routes.dart';

class AppPage {
  static final pages = {
    RouteName.introductionScreen: (context) => const Introduction(),
    RouteName.homeScreen: (context) => const HomeScreen(),
  };
}
