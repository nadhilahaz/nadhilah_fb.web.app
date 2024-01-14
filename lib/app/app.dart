import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
// import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_input.dart';
// import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_viewadmin.dart';
import 'package:nadhilah_fb/ui_screen/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Material App',
      // theme: ThemeData(colorScheme: const ColorScheme.dark()),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LoginPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
