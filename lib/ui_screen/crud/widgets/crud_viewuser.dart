// import 'package:english_words/english_words.dart';
// import 'dart:math';

import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:nadhilah_fb/models/user.dart';
// import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_detail.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_input.dart';

class ListViewUser extends StatefulWidget {
  const ListViewUser({
    super.key,
  });

  @override
  State<ListViewUser> createState() => _ListViewUserState();
}

class _ListViewUserState extends State<ListViewUser> {
  @override
  void initState() {
    loadMore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang'),
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
                          // leading: data.image.isEmpty ? const Text('text') : Image.network(data.image),
                          leading: Image.network(data.image),
                          // leading: data.image.isEmpty ? const Text('No Image') : Image.network(data.image),

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
                              // IconButton(
                              //   onPressed: () async {
                              //     final updateUser = data.copyWith();

                              //   },
                              //   icon: const Icon(Icons.loop),
                              // ),
                              IconButton(
                                onPressed: () async {
                                  final updateUser = UserX(
                                    id: id,
                                    namabarang: Random().toString(),
                                    createdAt: data.createdAt,
                                    // harga: WordPair.random().toString(),
                                  );
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
