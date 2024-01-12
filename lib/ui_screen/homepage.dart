import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 112, 217),
        title: const Text('HazMart'),
        actions: [
          Center(
              child: IconButton(
                  onPressed: () {
                    html.window.open('https://www.instagram.com/nadhilahazr?igsh=cjJrcnVvNnYwNWEy', 'new');
                  },
                  icon: const Icon(Icons.person))),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                html.window.open('https://github.com/nadhilahaz/nadhilah_fb.web.app', 'new');
              },
              child: const Text('Github'),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Login Anonymus'),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Login With Google'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Belanja Hemat, di HazMart '),
          ],
        ),
      ),
    );
  }
}
