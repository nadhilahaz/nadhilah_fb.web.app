import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_detail.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_input.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/user.dart';

class CrudViewAdmin extends StatefulWidget {
  const CrudViewAdmin({
    super.key,
  });

  @override
  State<CrudViewAdmin> createState() => _CrudViewAdminState();
}

class _CrudViewAdminState extends State<CrudViewAdmin> {
  @override
  void initState() {
    final x = UserX(
      createdAt: '9999-99-99',
      namabarang: 'nad',
      id: 'sjhsa',
      harga: 17,
    );
    print(x);
    // print('hihiw');
    // final y = x.copyWith(
    //   umur: 22,
    //   nama: 'kk',
    // );
    // print(y);
    loadMore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
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
                    return const UserInput();
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
      body: FutureBuilder(
        future: getcoll(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    userList.length,
                    (index) {
                      final data = userList[index];
                      final id = data.id;
                      return Card(
                        child: ListTile(
                          selectedTileColor: const Color.fromARGB(255, 54, 31, 5),
                          selected: selectedId == id,
                          onTap: () {
                            setState(
                              () {
                                selectedId = id;
                              },
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetail(
                                  id: id,
                                ),
                              ),
                            );
                          },
                          title: Text(data.namabarang),
                          subtitle: Text(data.createdAt),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await delete(data);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final updateUser = data.copyWith(
                                    harga: Random().nextInt(100),
                                    namabarang: WordPair.random().toString(),
                                  );
                                  // final updateUser = UserX(
                                  //   id: id,
                                  // umur: Random().nextInt(100),
                                  // createdAt: data.createdAt,
                                  // nama: WordPair.random().toString(),
                                  // );
                                  await update(updateUser);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.loop),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  isEnd
                      ? const Text('End Of List')
                      : snapshot.connectionState == ConnectionState.waiting
                          ? const CircularProgressIndicator()
                          : OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  loadMore();
                                });
                              },
                              child: const Text('Load More'),
                            )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
