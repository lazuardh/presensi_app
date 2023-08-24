import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/data/service/profile_service.dart';
import 'package:provider/provider.dart';

import '../../../../utilities/colors.dart';
import '../../../../utilities/text_styles.dart';
import '../../../../widgets/rounded_button.dart';
import 'build_list_tile.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({
    super.key,
    required this.isEditing,
  });

  final bool isEditing;

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  void showSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(milliseconds: 3000),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isEditing
        ? Consumer<ProfileService>(
            builder: (context, valueProfile, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  BuildListTileField(
                      icon: Icons.person_2,
                      title: "full name",
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(),
                          isCollapsed: true,
                          isDense: true,
                        ),
                      )),
                  BuildListTileField(
                      icon: Icons.email,
                      title: "Email Address",
                      child: TextFormField(
                        initialValue: valueProfile.userProfile!['email'],
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(),
                          isCollapsed: true,
                          isDense: true,
                        ),
                      )),
                  BuildListTileField(
                      icon: Icons.home_filled,
                      title: "Address",
                      child: TextFormField(
                        controller: adressController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(),
                          isCollapsed: true,
                          isDense: true,
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  RoundedButton(
                    onPress: () async {
                      valueProfile.isLoading == false;

                      final hasil = await valueProfile.updateProfile(
                          nameController.text, adressController.text);

                      if (valueProfile.message.isNotEmpty) {
                        showSnackbar(hasil.toString());
                      }
                    },
                    backgroundColor: purple200,
                    child: Text(
                      "Save",
                      style: text3(white, bold),
                    ),
                  )
                ]),
              );
            },
          )
        : Consumer<ProfileService>(
            builder: (context, profileServoce, child) => FutureBuilder(
              future: profileServoce.getDataUserProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasData) {
                  Map<String, dynamic> userProfile =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      BuildListTileField(
                        icon: Icons.person_2,
                        title: "full name",
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            userProfile['nama'],
                            style: text3(dark, regular),
                          ),
                        ),
                      ),
                      BuildListTileField(
                        icon: Icons.email,
                        title: "Email Address",
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            userProfile['email'],
                            style: text3(dark, regular),
                          ),
                        ),
                      ),
                      BuildListTileField(
                        icon: Icons.home_filled,
                        title: "Address",
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            userProfile['alamat'],
                            style: text3(dark, regular),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ]),
                  );
                } else {
                  return const Center(
                    child: Text("Data tidak tersedia"),
                  );
                }
              },
            ),
          );
  }
}
