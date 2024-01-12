import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_ctrl.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload dan Download'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
            //biar anu pas di pick baru muncul
            pickImage == null ? const SizedBox.shrink() : Text('${pickImage?.path},'),
            pickImage == null
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                      '${pickImage?.path}',
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: imageUpload == null ? Future.delayed(Duration.zero) : upload(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () async {
                    imageUpload = pickImage;
                    // debugPrint(uploadImage.toString());
                    await upload();
                    setState(() {});
                  },
                  child: const Text(
                    "Upload Image",
                  ),
                );
              },
            ),
            Text(imageUrl),
            imageUrl.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(imageUrl),
                  ),
          ],
        ),
      ),
      // body: FutureBuilder(
      //   future: FirebaseStorage.instance.ref().listAll(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return Column(
      //         children: [
      //           ...List.generate(snapshot.data!.items.length, (index) {
      //             return Card(
      //               child: ListTile(
      //                 title: Text(snapshot.data!.items[index].name),
      //                 subtitle: Text(snapshot.data!.items[index].fullPath),
      //                 trailing: IconButton(
      //                   onPressed: () async {
      //                     final result = await snapshot.data!.items[index].getDownloadURL();
      //                     debugPrint(result);
      //                   },
      //                   icon: const Icon(Icons.download),
      //                 ),
      //                 leading: FutureBuilder(
      //                   future: snapshot.data!.items[index].getDownloadURL(),
      //                   builder: (context, snapshot) {
      //                     if (snapshot.hasData) {
      //                       return CircleAvatar(
      //                         backgroundImage: NetworkImage(snapshot.data.toString()),
      //                       );
      //                     }
      //                     return const Icon(Icons.people);
      //                   },
      //                 ),
      //               ),
      //             );
      //           })
      //         ],
      //       );
      //     }
      //     return const Text('text');
      //   },
      // ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //         onPressed: () async {
      //           final result = await FirebaseStorage.instance.ref().listAll();
      //           debugPrint(result.toString());
      //           debugPrint(result.items.toString());
      //           debugPrint(result.items[1].toString());
      //         },
      //         child: const Text(
      //           "Get Image",
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
