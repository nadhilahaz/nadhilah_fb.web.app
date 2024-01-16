import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nadhilah_fb/models/user.dart';
import 'package:nadhilah_fb/ui_screen/crud/crud_data.dart';
import 'package:nadhilah_fb/ui_screen/storage/storage_data.dart';

Future<void> create(ProductX data) async {
  final dataDetail = data.toMap();
  final docId = data.id;
  // var nama = data.nama;
  // final createdAt = data.createdAt;
  final dataBarang = {
    'namabarang': data.namabarang,
    'id': data.id,
    'created_at': data.createdAt,
    'image': data.image,
    'harga': data.hargaproduk,
  };

  await FirebaseFirestore.instance.collection('namaProduk').doc(docId).set(dataBarang);
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
// Future<void> update(ProductX newData) async {
//   final dataDetail = newData.toMap();
//   final docId = newData.id;
//   // var nama = newData.namabarang;
//   // final createdAt = newData.createdAt;
//   // final databarang = {
//   //   'namabarang': newData.namabarang,
//   //   'id': newData.id,
//   //   'created_at': newData.createdAt,
//   //   'image': image,
//   // };

//   // await FirebaseFirestore.instance.collection('namaProduk').doc(docId).update(databarang);
//   await FirebaseFirestore.instance.collection('detail').doc(docId).update(dataDetail);
//   final index = userList.indexWhere((element) => element.id == docId);
//   userList[index] = newData;
// }

Future<void> updateProd(ProductX data) async {
  final produk = data.toMap();
  final docId = data.id;
  final dataBarang = {
    'namabarang': data.namabarang,
    'id': data.id,
    'created_at': data.createdAt,
    'image': data.image,
    'harga': data.hargaproduk,
  };
  await FirebaseFirestore.instance.collection('namaProduk').doc(docId).set(dataBarang);
  await FirebaseFirestore.instance.collection('detail').doc(docId).set(produk);
  final index = userList.indexWhere((element) => element.id == docId);
  userList[index] = data;
}

// Future<void> updateProduct(UserX data) async {
//   final product = data.toMap();
//   final docId = data.id;
//   // await FirebaseFirestore.instance.collection('Detail').doc(docId).update(product);
//   await FirebaseFirestore.instance.collection('detail').doc(docId).update(product);
//   final index = userList.indexWhere((element) => element.id == docId);
//   userList[index] = data;
// }

// Future<void> update(String docId, UserX newData) async {
//   final dataDetail = newData.toMap();
//   final dataBarang = {
//     'namabarang': newData.namabarang,
//     'id': newData.id,
//     'created_at': newData.createdAt,
//     'image': newData.image,
//     'harga': newData.hargaproduk,
//   };

//   await FirebaseFirestore.instance.collection('namaProduk').doc(docId).update(dataBarang);
//   await FirebaseFirestore.instance.collection('detail').doc(docId).update(dataDetail);

//   // Optional: Update local userList if needed
//   final index = userList.indexWhere((element) => element.id == docId);
//   if (index != -1) {
//     userList[index] = newData;
//   }
// }

Future<void> delete(ProductX data) async {
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
Future<List<ProductX>> getcoll() async {
  List<ProductX> users = [];
  // final result = await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).get();
  final result =
      // await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).limit(3).get();
      await FirebaseFirestore.instance
          .collection('namaProduk')
          .orderBy('created_at', descending: true)
          .limit(5)
          .startAfter([userList.isEmpty ? '9999-99-99' : userList.last.createdAt]).get();
  for (var element in result.docs) {
    users.add(ProductX.fromMap(element.data()));
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

Future<ProductX> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
  final user = ProductX.fromMap(result.data() ?? {});
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

// Future<void> saveData() async {
//   await Future.delayed(const Duration(seconds: 2));
// }

// void updateProduct(UserX data) async {
//   final product = data.toMap();
//   final docId = data.id;

//   await FirebaseFirestore.instance.collection('nama Product').doc(docId).set(product);
//   final index = userList.indexWhere((element) => element.id == docId);
//   userList[index] = data;
// }
// Future<void> updateproduct(UserX data) async {
//   final dataDetail = data.toMap();
//   final docId = data.id;
//   // var nama = data.nama;
//   // final createdAt = data.createdAt;
//   // final dataUserName = {
//   //   'namabarang': data.namabarang,
//   //   'id': data.id,
//   //   'created_at': data.createdAt,
//   //   'image': image,
//   // };

//   await FirebaseFirestore.instance.collection('username').doc(docId).set(dataDetail);
//   // await FirebaseFirestore.instance.collection('detail').doc(docId).set(dataDetail);
//   final index = userList.indexWhere((element) => element.id == docId);
//   userList[index] = data;
// }

