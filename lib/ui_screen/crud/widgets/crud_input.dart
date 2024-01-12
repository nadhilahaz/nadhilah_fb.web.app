import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_ctrl.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final ctrlnama = TextEditingController();
  final ctrlstok = TextEditingController();
  var isLoading = false;
  var isShowClearnama = false;
  var isShowClearumur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input Barang'),
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
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrlstok,
                onChanged: (value) {
                  setState(() {
                    isShowClearumur = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: isShowClearumur
                      ? IconButton(
                          onPressed: () {
                            ctrlstok.clear();
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
                  hintText: 'stok',
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
                      var x = ctrlnama.text;
                      var y = int.parse(ctrlstok.text);
                      var z = ({'nama': x, 'stok': y});
                      setState(
                        () {
                          isLoading = true;
                        },
                      );
                      await create(z);
                      setState(
                        () {
                          isLoading = false;
                        },
                      );
                      ctrlnama.clear();
                      ctrlstok.clear();
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
