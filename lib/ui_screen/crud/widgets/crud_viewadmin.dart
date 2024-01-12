import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_input.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_detail.dart';

class CrudViewAdmin extends StatefulWidget {
  const CrudViewAdmin({
    super.key,
  });

  @override
  State<CrudViewAdmin> createState() => _CrudViewAdminState();
}

var selectedId = '';

class _CrudViewAdminState extends State<CrudViewAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Produk'),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Input();
                    },
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              child: const Icon(Icons.refresh),
            )
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
                          selectedTileColor: const Color.fromARGB(255, 5, 15, 51),
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
                                      )),
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
        ));
  }
}
