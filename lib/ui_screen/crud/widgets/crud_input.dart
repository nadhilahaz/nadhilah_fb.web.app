import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Input'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.white),
              //     borderRadius: BorderRadius.circular(20),
              //     image: Image.network('${}')
              //   ),
              // ),
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
                  pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  setState(() {});
                  // debugPrint(pickImage.toString());
                  // debugPrint(pickImage!.name);
                  // debugPrint(pickImage!.mimeType);
                },
                child: const Text(
                  "Get Image",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrlnamabarang,
                onChanged: (value) {
                  setState(
                    () {
                      isShowClearnamabarang = value.isNotEmpty;
                    },
                  );
                },
                decoration: InputDecoration(
                  suffixIcon: isShowClearnamabarang
                      ? IconButton(
                          onPressed: () {
                            ctrlnamabarang.clear();
                            setState(
                              () {
                                isShowClearnamabarang = false;
                              },
                            );
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                  border: const OutlineInputBorder(),
                  hintText: 'Nama Barang',
                  labelText: 'Nama Barang',
                  // prefix: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrlharga,
                onChanged: (value) {
                  setState(() {
                    isShowClearharga = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: isShowClearharga
                      ? IconButton(
                          onPressed: () {
                            ctrlharga.clear();
                            setState(
                              () {
                                isShowClearharga = false;
                              },
                            );
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                  border: const OutlineInputBorder(),
                  hintText: 'Harga',
                  labelText: 'Harga',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: ctrlstok,
                onChanged: (value) {
                  setState(() {
                    isShowClearstok = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: isShowClearstok
                      ? IconButton(
                          onPressed: () {
                            ctrlstok.clear();
                            setState(
                              () {
                                isShowClearstok = false;
                              },
                            );
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                  border: const OutlineInputBorder(),
                  hintText: 'Stok',
                  labelText: 'Stok',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // OutlinedButton(
                  //   onPressed: () {
                  //     ctrlnama.clear();
                  //     ctrlumur.clear();
                  //   },
                  //   child: const Text('Clear'),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          var valNamaBarang = ctrlnamabarang.text;
                          var valHarga = int.parse(ctrlharga.text);
                          var valStok = int.parse(ctrlstok.text);
                          final id = UniqueKey().toString();
                          // final imageupload = await upload();

                          setState(
                            () {
                              isLoading = true;
                            },
                          );
                          await upload(id);
                          setState(() {});
                          final newUser = ProductX(
                              id: id,
                              namabarang: valNamaBarang,
                              hargaproduk: valHarga,
                              stok: valStok,
                              createdAt: DateTime.now().toString(),
                              image: image);

                          await create(newUser);
                          setState(
                            () {
                              isLoading = false;
                            },
                          );
                          ctrlnamabarang.clear();
                          ctrlharga.clear();
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);

                          // debugPrint(x.runtimeType.toString());
                          // debugPrint(y.runtimeType.toString());
                        },
                        child: Text(isLoading ? 'Loading...' : 'Submit'),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // pickImage == null
                      //     ? const SizedBox.shrink()
                      //     : pickImage == null
                      //         ? const SizedBox.shrink()
                      //         : SizedBox(
                      //             height: 150,
                      //             width: 150,
                      //             child: Image.network(
                      //               '${pickImage?.path}',
                      //             ),
                      //           ),
                      const SizedBox(
                        height: 10,
                      ),
                      // FutureBuilder(
                      //   future: imageUpload == null ? Future.delayed(Duration.zero) : upload(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState == ConnectionState.waiting) {
                      //       return const CircularProgressIndicator();
                      //     }
                      //     return OutlinedButton(
                      //       onPressed: () async {
                      //         imageUpload = pickImage;
                      //         // debugPrint(uploadImage.toString());
                      //         await upload();
                      //         setState(() {});
                      //       },
                      //       child: const Text(
                      //         "Upload Image",
                      //       ),
                      //     );
                      //   },
                      // ),
                      // Text(imageUrl),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
