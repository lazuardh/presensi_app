import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/data/service/profile_service.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../routes/name_routes.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileService>(
      builder: (context, profileProvider, child) => FutureBuilder(
        future: profileProvider.getDataUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            Map<String, dynamic> userProfile =
                snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildProfile(
                    img: NetworkImage(
                      "https://ui-avatars.com/api/?name=${userProfile['nama']}",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${userProfile['nama']}",
                    style: heading1(dark, semibold),
                  ),
                  Text(
                    "${userProfile['posisi']}",
                    style: text3(dark, regular),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteName.updateProfile,
                    ),
                    // tileColor: lightGrey,
                    leading: const CircleAvatar(
                      backgroundColor: purple200,
                      child: Icon(
                        Icons.person_2,
                        color: white,
                      ),
                    ),
                    title: Text(
                      "Update Profile",
                      style: text3(dark, semibold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {},
                    // tileColor: lightGrey,
                    leading: const CircleAvatar(
                      backgroundColor: purple200,
                      child: Icon(
                        Icons.lock,
                        color: white,
                      ),
                    ),
                    title: Text(
                      "Update Password",
                      style: text3(dark, semibold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  if (userProfile['role'] == "admin")
                    ListTile(
                      onTap: () {},
                      // tileColor: lightGrey,
                      leading: const CircleAvatar(
                        backgroundColor: purple200,
                        child: Icon(
                          Icons.people_alt,
                          color: white,
                        ),
                      ),
                      title: Text(
                        "Add Pegawai",
                        style: text3(dark, semibold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.login,
                        (route) => false,
                      );
                    },
                    // tileColor: lightGrey,
                    leading: const CircleAvatar(
                      backgroundColor: purple200,
                      child: Icon(
                        Icons.login_outlined,
                        color: white,
                      ),
                    ),
                    title: Text(
                      "Logout",
                      style: text3(purple200, semibold),
                    ),
                  )
                ],
              ),
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

class BuildProfile extends StatelessWidget {
  const BuildProfile({
    super.key,
    required this.img,
  });

  final ImageProvider img;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.3,
      height: size.height * 0.15,
      child: Stack(
        children: [
          CircleAvatar(
            maxRadius: double.infinity,
            backgroundColor: purple200,
            backgroundImage: img,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: CircleAvatar(
              backgroundColor: dark,
              child: IconButton(
                isSelected: true,
                color: white,
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
