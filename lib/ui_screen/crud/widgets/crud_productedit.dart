import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';

class UserEdit extends StatelessWidget {
  const UserEdit({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Detail'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDoc(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: data.namabarang,
                            decoration: const InputDecoration(
                              labelText: 'Nama Barang',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: data.harga.toString(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Harga',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            initialValue: data.stok.toString(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Stok',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        saveData();
                        Navigator.pop(context);
                      },
                      child: const Text('Simpan Perubahan'),
                    ),
                  ],
                ),
              );
            }
            return const Text('text');
          },
        ),
      ),
    );
  }
}
