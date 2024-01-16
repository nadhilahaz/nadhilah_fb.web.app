import 'package:firebase_storage/firebase_storage.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

// Future<String> upload() async {
//   final data = await pickImage!.readAsBytes();
//   final typePhoto = pickImage?.mimeType;
//   final namaPhoto = pickImage?.name;
//   final metaData = SettableMetadata(contentType: typePhoto);
//   final uploadImage = await FirebaseStorage.instance.ref(namaPhoto).putData(
//         data,
//         metaData,
//       );
//   image = await uploadImage.ref.getDownloadURL();
//   // imageUrl;
//   return image.toString();
// }
Future<String> upload(String id) async {
  final typeFoto = pickImage?.mimeType;
  final imageBytes = await pickImage!.readAsBytes();
  final namaFoto = id;
  final metaData = SettableMetadata(contentType: typeFoto);
  final uploadImage = await FirebaseStorage.instance.ref(namaFoto).putData(imageBytes, metaData);
  image = await uploadImage.ref.getDownloadURL();
  pickImage = null;
  return image;
  // return uploadImage.toString();
}
