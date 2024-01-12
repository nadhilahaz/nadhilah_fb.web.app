import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/user.dart';

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
              TextField(
                controller: ctrlnama,
                onChanged: (value) {
                  setState(
                    () {
                      isShowClearnama = value.isNotEmpty;
                    },
                  );
                },
                decoration: InputDecoration(
                    suffixIcon: isShowClearnama
                        ? IconButton(
                            onPressed: () {
                              ctrlnama.clear();
                              setState(
                                () {
                                  isShowClearnama = false;
                                },
                              );
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                    border: const OutlineInputBorder(),
                    hintText: 'nama',
                    labelText: 'Nama',
                    prefix: const Icon(Icons.person)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrlharga,
                onChanged: (value) {
                  setState(() {
                    isShowClearumur = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: isShowClearumur
                      ? IconButton(
                          onPressed: () {
                            ctrlharga.clear();
                            setState(
                              () {
                                isShowClearumur = false;
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
                  OutlinedButton(
                    onPressed: () async {
                      var valNamaBarang = ctrlnama.text;
                      var valHarga = int.parse(ctrlharga.text);
                      final id = UniqueKey().toString();
                      final newUser = UserX(
                          id: id, namabarang: valNamaBarang, harga: valHarga, createdAt: DateTime.now().toString());

                      // var z = ({'nama': x, 'umur': y});
                      setState(
                        () {
                          isLoading = true;
                        },
                      );
                      await create(newUser);
                      setState(
                        () {
                          isLoading = false;
                        },
                      );
                      ctrlnama.clear();
                      ctrlharga.clear();
                      Navigator.pop(context);

                      // debugPrint(x.runtimeType.toString());
                      // debugPrint(y.runtimeType.toString());
                    },
                    child: Text(isLoading ? 'Loading...' : 'Submit'),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
