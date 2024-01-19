import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

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
  void initState() {
    super.initState();

    ctrleditNamaProduk.text = useredit!.namabarang;
    ctrleditHargaProduk.text = useredit!.hargaproduk.toString();
    ctrleditStokProduk.text = useredit!.stok.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk'),
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
                  ElevatedButton(
                    onPressed: () async {
                      pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: const Text(
                      "Get Image",
                    ),
                  ),

                  pickImage == null
                      ? SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(useredit!.image),
                        )
                      : SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(
                            pickImage!.path,
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Text(image),
                  // image.isEmpty
                  //     ? const SizedBox.shrink()
                  //     : SizedBox(
                  //         height: 150,
                  //         width: 150,
                  //         child: Image.network(image),
                  //       ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrleditNamaProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClearnamabarang = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Nama produk',
                      labelText: 'Nama produk',
                      suffixIcon: isShowClearnamabarang
                          ? IconButton(
                              onPressed: () {
                                ctrleditNamaProduk.clear();
                                setState(() {
                                  isShowClearnamabarang = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 118, 144, 170))),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 118, 144, 170))),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ctrleditHargaProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClearharga = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Harga produk',
                      suffixIcon: isShowClearharga
                          ? IconButton(
                              onPressed: () {
                                ctrleditHargaProduk.clear();
                                setState(() {
                                  isShowClearharga = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 118, 144, 170))),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 118, 144, 170))),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ctrleditStokProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClearstok = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Stok produk',
                      suffixIcon: isShowClearstok
                          ? IconButton(
                              onPressed: () {
                                ctrleditStokProduk.clear();
                                setState(() {
                                  isShowClearstok = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 118, 144, 170))),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 118, 144, 170))),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),

                  OutlinedButton(
                    onPressed: () async {
                      final id = snapshot.data!.id;
                      final image = await upload(id);
                      final valNama = ctrleditNamaProduk.text;
                      final valHarga = int.parse(ctrleditHargaProduk.text);
                      final valStok = int.parse(ctrleditStokProduk.text);
                      final newProduct = ProductX(
                        image: image,
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
                      ctrleditNamaProduk.clear();
                      ctrleditHargaProduk.clear();
                      ctrleditStokProduk.clear();

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
