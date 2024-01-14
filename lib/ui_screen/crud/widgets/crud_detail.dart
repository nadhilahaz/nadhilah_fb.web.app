import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/crud_productedit.dart';
// import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserEdit(id: id)),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: getDoc(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final datax = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    datax.image.isEmpty
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(datax.image),
                          ),
                    Text('Nama Barang: ${datax.namabarang}'),
                    Text('Harga : Rp ${datax.harga.toString()}'),
                    Text('Stok: ${datax.stok.toString()}'),
                    Text('Tanggal Pembuatan: ${datax.createdAt}'),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
