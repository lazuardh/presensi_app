import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/data/service/add_pegawai.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_button.dart';
import 'package:flutter_application_1/presentation/widgets/rounded_text_field.dart';
import 'package:provider/provider.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _key = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   final addDatas = Provider.of<AddEmployeeProvider>(context, listen: false);
  //   addDatas.addEmployee();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<AddEmployeeProvider>(context);
    return Background(
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedTextField(
              controller: employee.nipContr,
              icon: Icons.person_add,
              hintText: "NIP",
              onChanged: (value) {},
            ),
            RoundedTextField(
              controller: employee.namaContr,
              icon: Icons.person,
              hintText: "Nama",
              onChanged: (value) {},
            ),
            RoundedTextField(
              controller: employee.emailContr,
              icon: Icons.email,
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "ADD PEGAWAI",
              onPress: () {
                employee.addEmployee();
              },
              backgroundColor: lightPurple,
              textColor: white,
            )
          ],
        ),
      ),
    );
  }
}
