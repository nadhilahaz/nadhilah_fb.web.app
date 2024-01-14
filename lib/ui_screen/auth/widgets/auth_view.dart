import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_viewadmin.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_viewuser.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) => Column(
                children: [
                  snapshot.hasData
                      ? Column(
                          children: [
                            Text(snapshot.data!.uid),
                            Text(snapshot.data!.isAnonymous
                                ? 'Sign In by Anonim'
                                : 'Sign In by Email ${snapshot.data!.email}'),
                          ],
                        )
                      : const Text('Login Here'),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: snapshot.data == null
                        ? () async {
                            final provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});

                            await FirebaseAuth.instance.signInWithPopup(provider);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListViewUser(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      "Sign In Google",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: snapshot.data == null
                        ? () async {
                            await FirebaseAuth.instance.signInAnonymously();
                            // Setelah sign-in anonim berhasil, navigasi ke halaman CrudViewUser
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListViewAdmin(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      "Sign In Anonymus",
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: snapshot.data == null
                        ? () async {
                            final provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});

                            await FirebaseAuth.instance.signInWithPopup(provider);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListViewAdmin(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      "Sign In Admin",
                    ),
                  ),
                  // OutlinedButton(
                  //   onPressed: snapshot.data == null
                  //       ? null
                  //       : () async {
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: snapshot.data == null
                        ? null
                        : () async {
                            await FirebaseAuth.instance.currentUser!.delete();
                          },
                    child: const Text(
                      "Delete Akun",
                    ),
                  ),
                  //           await FirebaseAuth.instance.signOut();
                  //         },
                  //   child: const Text(
                  //     "Sign Out",
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Belanja Hemat di HazMart',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
