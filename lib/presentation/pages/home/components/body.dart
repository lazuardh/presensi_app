import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';

import 'background.dart';
import 'rounded_button_add_employee.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          RoundedButtonAddEmployee(
            onPress: () => Navigator.pushNamed(
              context,
              RouteName.pegawai,
            ),
          ),
        ],
      ),
    );
  }
}
