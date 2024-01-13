import 'package:firebase_storage/firebase_storage.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

Future<String> upload() async {
  final data = await pickImage!.readAsBytes();
  final typePhoto = pickImage?.mimeType;
  final namaPhoto = pickImage?.name;
  final metaData = SettableMetadata(contentType: typePhoto);
  final uploadImage = await FirebaseStorage.instance.ref(namaPhoto).putData(
        data,
        metaData,
      );
  imageUrl = await uploadImage.ref.getDownloadURL();
  // imageUrl;
  return uploadImage.toString();
}
