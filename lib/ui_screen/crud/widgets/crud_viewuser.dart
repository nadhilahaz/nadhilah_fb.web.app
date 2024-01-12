import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/auth/widgets/auth_view.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_detail.dart';

class CrudViewUser extends StatefulWidget {
  const CrudViewUser({
    super.key,
  });

  @override
  State<CrudViewUser> createState() => _CrudViewUserState();
}

var selectedId = '';

class _CrudViewUserState extends State<CrudViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthView(),
                ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: getcoll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return const Text('Empty');
              }
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  ...List.generate(snapshot.data!.docs.length, (index) {
                    final data = snapshot.data!.docs[index];
                    final id = data.id;
                    return Card(
                      child: ListTile(
                        selectedTileColor: const Color.fromARGB(255, 0, 23, 108),
                        selected: selectedId == id,
                        onTap: () {
                          setState(() {
                            selectedId = id;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(
                                id: id,
                              ),
                            ),
                          );
                        },
                        title: Text(
                          data.data()['nama'],
                        ),
                        subtitle: Text(id),
                      ),
                    );
                  })
                ],
              );
            }
            return const Text('text');
          },
        ),
      ),
    );
  }
}
