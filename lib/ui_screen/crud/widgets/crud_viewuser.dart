// import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_detail.dart';

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
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'SignOut',
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser!.delete();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.dangerous_outlined,
              color: Colors.white,
            ),
            tooltip: 'Delete Akun',
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Icon(Icons.refresh),
              ),
              const SizedBox(
                height: 15,
              ),
              FloatingActionButton(
                onPressed: () {
                  // setState(() {});
                },
                child: const Icon(Icons.shopping_basket),
              ),
            ],
          )
        ],
      ),
      body: FutureBuilder(
        future: getcoll(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? userList.isEmpty
                  ? const Center(child: Text('data is empty'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                ...List.generate(
                                  userList.length,
                                  (index) {
                                    final data = userList[index];
                                    final id = data.id;
                                    return GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 229, 230, 233),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              SizedBox(width: 100, height: 100, child: Image.network(data.image)),
                                              const SizedBox(height: 10),
                                              // Text(data.namabarang),
                                              Text(
                                                (data.namabarang),
                                                style: const TextStyle(color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'Rp. ${data.hargaproduk.toString()}',
                                                style: const TextStyle(color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => UserDetail(id: id)),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          isEnd
                              ? const Text('end of product')
                              : snapshot.connectionState == ConnectionState.waiting
                                  ? const CircularProgressIndicator()
                                  : OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          loadMore();
                                        });
                                      },
                                      child: const Text('load more'),
                                    )
                        ],
                      ),
                    )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
