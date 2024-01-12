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
                html.window.open('https://github.com/nadhilahaz/nadhilah-fb.web.app', 'new');
              },
              splashColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Git Hub',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
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
