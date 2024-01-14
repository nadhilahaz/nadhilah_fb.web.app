import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Detail'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDoc(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        pickImage == null
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.network(
                                  '${pickImage?.path}',
                                ),
                              ),
                        OutlinedButton(
                          onPressed: () async {
                            pickImage = await _imagePicker.pickImage(source: ImageSource.gallery);
                            setState(() {});
                          },
                          child: const Text(
                            "Pilih Gambar",
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              TextField(
                                controller: TextEditingController(text: data!.namabarang),
                                decoration: const InputDecoration(
                                  labelText: 'Nama Barang',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: TextEditingController(text: data.hargaproduk.toString()),
                                decoration: const InputDecoration(
                                  labelText: 'Harga',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: TextEditingController(text: data.stok.toString()),
                                decoration: const InputDecoration(
                                  labelText: 'Stok',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        final editnamabarang = ctrlnamabarang.text;
                        final editharga = int.parse(ctrlharga.text);
                        final editstok = int.parse(ctrlstok.text);
                        final editcreatedAt = DateTime.now();
                        final editimage = image;
                        final id = selectedId;

                        final editproduct = UserX(
                          namabarang: editnamabarang,
                          hargaproduk: editharga,
                          id: id,
                          stok: editstok,
                          createdAt: editcreatedAt.toString(),
                          image: editimage,
                        );
                        ctrlnamabarang.clear();
                        ctrlharga.clear();
                        ctrlstok.clear();

                        Navigator.pop(context);
                        Navigator.pop(context);
                        updateproduct(editproduct);
                      },
                      child: const Text(
                        "Edit Product",
                      ),
                    ),
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
