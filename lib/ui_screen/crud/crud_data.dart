import 'package:flutter/material.dart';
import 'package:nadhilah_fb/models/user.dart';

final ctrlnamabarang = TextEditingController();
final ctrlharga = TextEditingController();
final ctrlimage = TextEditingController();
final ctrlstok = TextEditingController();
final ctrlcreatedAt = TextEditingController();
var isLoading = false;
var isShowClearnamabarang = false;
var isShowClearharga = false;
var isShowClearstok = false;
var selectedId = '';
List<UserX> userList = [];
var isEnd = false;
