import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/home/home_screen.dart';
import 'package:flutter_application_1/presentation/pages/profile/profile_screen.dart';

import '../../utilities/colors.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedPage = 0;
  final _pages = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: lightPurple,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.history_edu, title: 'History'),
          TabItem(icon: Icons.fingerprint, title: 'add'),
          TabItem(icon: Icons.location_on, title: 'Location'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 2,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
