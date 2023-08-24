import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';

import 'components/build_container_profile.dart';
import 'components/personal_profile.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  int isSelectted = 0;
  bool isEditing = false;

  List<String> titleContainerProfile = [
    'Personal',
    'Profesional',
    'Documents',
  ];

  List<String> personalProfile = ['full Name', 'Email Address', 'Address'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleBar(context),
      body: Column(
        children: [
          BuildContainerProfile(
            child: ListView.builder(
              itemCount: titleContainerProfile.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isSelectted = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: BoxDecoration(
                    color: isSelectted == index ? purple200 : lightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      titleContainerProfile[index],
                      style: text3(
                        isSelectted == index ? white : purple200,
                        regular,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          isSelectted == 0
              ? PersonalProfile(
                  isEditing: isEditing,
                )
              : isSelectted == 1
                  ? Text("2")
                  : Text("e")
        ],
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: purple200,
          child: InkWell(
            splashColor: Colors.white, // Warna efek splash saat FAB ditekan.
            child: const SizedBox(
              width: 56, // Lebar FAB.
              height: 56, // Tinggi FAB.
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
            ),
            onTap: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget titleBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: white,
      ),
    ),
    title: Text(
      "MY PROFILE",
      style: text1(white, bold),
    ),
    backgroundColor: lightPurple,
  );
}
