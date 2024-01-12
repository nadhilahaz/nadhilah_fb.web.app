import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> create(Map<String, dynamic> data) async {
  final docId = UniqueKey().toString();
  var nama = data['nama'];

  await FirebaseFirestore.instance.collection('username').doc(docId).set({'nama': nama});
  await FirebaseFirestore.instance.collection('detail').doc(docId).set(data);
}

Future<QuerySnapshot<Map<String, dynamic>>> getcoll() async {
  final result = await FirebaseFirestore.instance.collection('username').get();
  return result;
}

Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('detail').doc(id).get();
  return result;
}
