import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/data/service/authentication.dart';
import 'package:flutter_application_1/presentation/routes/name_routes.dart';
import 'package:provider/provider.dart';

import 'background.dart';
import 'rounded_button_add_employee.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      <(Color?, Color?, ShapeBorder?)>[
    (null, null, null), // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, CircleBorder()),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context);
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: auth.roleUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }

              if (auth.role == "admin") {
                return RoundedButtonAddEmployee(
                  onPress: () => Navigator.pushNamed(
                    context,
                    RouteName.pegawai,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          FloatingActionButton(
            foregroundColor: customizations[index].$1,
            backgroundColor: customizations[index].$2,
            shape: customizations[index].$3,
            child: const Icon(Icons.navigation),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.login,
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
