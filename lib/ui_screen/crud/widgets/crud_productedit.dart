import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  late ImagePicker _imagePicker;
  XFile? pickImage;

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
                                controller: TextEditingController(text: data.harga.toString()),
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
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
