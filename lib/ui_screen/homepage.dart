import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

import 'package:nadhilah_fb/ui_screen/auth/widgets/auth_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HazMart'),
        actions: [
          Center(
              child: Row(
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {
                  // Tindakan yang akan dijalankan saat tombol pertama ditekan
                  html.window.open('https://github.com/nadhilahaz/nadhilah_fb.web.app', 'new');
                },
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ],
          )),
        ],
      ),
      body: const AuthView(),
    );
  }
}
