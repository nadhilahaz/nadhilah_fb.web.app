import 'package:flutter/material.dart';
import 'package:nadhilah_fb/ui_screen/crud/widgets/user.dart';

final ctrlnama = TextEditingController();
final ctrlharga = TextEditingController();
var isLoading = false;
var isShowClearnama = false;
var isShowClearumur = false;
var selectedId = '';
List<UserX> userList = [];
var isEnd = false;
