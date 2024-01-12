import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:nadhilah_fb/ui_screen/auth/widgets/auth_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HazMart'),
        actions: [
          Center(
            child: MaterialButton(
              onPressed: () {
                html.window.open('https://github.com/nadhilahaz/nadhilah_fb.web.app', 'new');
              },
              // splashColor: Color.fromARGB(255, 22, 76, 148),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Git Hub',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 251, 246, 246),
                ),
              ),
            ),
          ),
        ],
      ),
      body: const AuthView(),
    );
  }
}
