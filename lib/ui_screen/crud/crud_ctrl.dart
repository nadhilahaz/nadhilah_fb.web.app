import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

Future<void> create(UserX data) async {
  final dataDetail = data.toMap();
  final docId = data.id;
  // var nama = data.nama;
  // final createdAt = data.createdAt;
  final dataUserName = {
    'namabarang': data.namabarang,
    'id': data.id,
    'created_at': data.createdAt,
    'image': image,
  };

  await FirebaseFirestore.instance.collection('namaProduk').doc(docId).set(dataUserName);
  await FirebaseFirestore.instance.collection('detail').doc(docId).set(dataDetail);
  // final index = userList.indexWhere((element) => element.id == docId);
  userList.insert(0, data);
}

// Future<void> create(ProductX data) async {
//   final map = data.toMap();
//   final docId = data.id;
//   final nama = data.nama;
//   final createdAt = data.createdAt;
//   final imageUrl = data.imageUrl;
//   final harga = data.harga;
//   await FirebaseFirestore.instance
//       .collection('productName')
//       .doc(docId)
//       .set({'nama': nama, 'id': docId, 'created_at': createdAt, 'image_url': imageUrl, 'harga': harga});
//   await FirebaseFirestore.instance.collection('productDetail').doc(docId).set(map);
//   userList.insert(0, data);
// }
Future<void> update(UserX data) async {
  final dataDetail = data.toMap();
  final docId = data.id;
  // var nama = data.nama;
  // final createdAt = data.createdAt;
  final dataUserName = {
    'namabarang': data.namabarang,
    'id': data.id,
    'created_at': data.createdAt,
    'image': image,
  };

  await FirebaseFirestore.instance.collection('username').doc(docId).set(dataUserName);
  await FirebaseFirestore.instance.collection('detail').doc(docId).set(dataDetail);
  final index = userList.indexWhere((element) => element.id == docId);
  userList[index] = data;
}

Future<void> delete(UserX data) async {
  final docId = data.id;
  await FirebaseFirestore.instance.collection('namaProduk').doc(docId).delete();
  await FirebaseFirestore.instance.collection('detail').doc(docId).delete();
  final index = userList.indexWhere((element) => element.id == docId);
  userList.removeAt(index);
}

// Future<QuerySnapshot<Map<String, dynamic>>> getcoll() async {
//   final result = await FirebaseFirestore.instance.collection('username').get();
//   return result;
// }
Future<List<UserX>> getcoll() async {
  List<UserX> users = [];
  // final result = await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).get();
  final result =
      // await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).limit(3).get();
      await FirebaseFirestore.instance
          .collection('namaProduk')
          .orderBy('created_at', descending: true)
          .limit(3)
          .startAfter([userList.isEmpty ? '9999-99-99' : userList.last.createdAt]).get();
  for (var element in result.docs) {
    users.add(UserX.fromMap(element.data()));
  }
  return users;
}
// Future<List<UserX>> getcoll() async {
//   List<UserX> users = [];
//   final result = await FirebaseFirestore.instance.collection('username').get();
//   for (var element in result.docs) {
//     users.add(UserX.fromMap(element.data()));
//   }
//   return users;
// }

// Future<QuerySnapshot<Map<String, dynamic>>> getcoll() async {
//   final result = await FirebaseFirestore.instance.collection('username').get();
//   return result;
// }

Future<UserX> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
  final user = UserX.fromMap(result.data() ?? {});
  return user;
}

// Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
//   final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
//   return result;
// }
Future<void> loadMore() async {
  final datacoll = await getcoll();
  userList.addAll(datacoll);
  if (datacoll.length < 3) {
    isEnd = true;
  }
}

Future<void> saveData() async {
  await Future.delayed(const Duration(seconds: 2));
}
