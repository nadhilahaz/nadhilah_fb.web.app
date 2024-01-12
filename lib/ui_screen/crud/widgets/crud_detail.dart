import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Produk'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDoc(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.data()!['nama']),
                      Text(snapshot.data!.data()!['stok'].toString()),
                    ],
                  ),
                );
              }
              return const Text('text');
            },
          ),
        ));
  }
}
