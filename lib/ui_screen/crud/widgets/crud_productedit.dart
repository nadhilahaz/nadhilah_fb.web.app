import 'package:flutter/material.dart';
import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/storage/widgets/storage_view.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Edit'),
      ),
      body: FutureBuilder(
        future: getDoc(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const StorageView(),
                  const SizedBox(height: 20),
                  TextField(
                    controller: editNamaProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClearnamabarang = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Masukkan nama produk',
                      labelText: 'Nama produk',
                      suffixIcon: isShowClearnamabarang
                          ? IconButton(
                              onPressed: () {
                                editNamaProduk.clear();
                                setState(() {
                                  isShowClearnamabarang = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: editHargaProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClearharga = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Contoh: 10000',
                      labelText: 'Harga produk',
                      suffixIcon: isShowClearharga
                          ? IconButton(
                              onPressed: () {
                                editHargaProduk.clear();
                                setState(() {
                                  isShowClearharga = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: editStokProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClearstok = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Contoh: 1000',
                      labelText: 'Stok produk',
                      suffixIcon: isShowClearstok
                          ? IconButton(
                              onPressed: () {
                                editStokProduk.clear();
                                setState(() {
                                  isShowClearstok = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final id = snapshot.data!.id;
                      final dwUrl = await upload(id);
                      final valNama = editNamaProduk.text;
                      final valHarga = int.parse(editHargaProduk.text);
                      final valStok = int.parse(editStokProduk.text);
                      final newProduct = ProductX(
                        image: dwUrl,
                        namabarang: valNama,
                        hargaproduk: valHarga,
                        id: id,
                        stok: valStok,
                        createdAt: DateTime.now().toString(),
                      );
                      setState(() {
                        isLoading = true;
                      });
                      await updateProd(newProduct);

                      // Clear controllers after using their values
                      editNamaProduk.clear();
                      editHargaProduk.clear();
                      editStokProduk.clear();

                      setState(() {
                        isLoading = false;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: Text(isLoading ? 'Loading...' : 'Submit'),
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
