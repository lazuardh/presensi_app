import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/presentation/data/service/add_pegawai.dart';
import 'package:flutter_application_1/presentation/data/service/authentication.dart';
import 'package:flutter_application_1/presentation/data/service/password_service.dart';
import 'package:flutter_application_1/presentation/data/service/profile_service.dart';
import 'package:flutter_application_1/presentation/routes/page_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AddEmployeeProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => AuthenticationService(),
            ),
            ChangeNotifierProvider(
              create: (_) => PasswordService(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProfileService(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routes: AppPage.pages,
            initialRoute: snapshot.hasData && snapshot.data != null
                ? '/navigation'
                : '/welcome',
          ),
        );
      },
    );
  }
}
