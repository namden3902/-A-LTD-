import 'package:doan_laptrinhdidong/khangia.dart';
import 'package:doan_laptrinhdidong/lichsutrochoi.dart';
import 'package:doan_laptrinhdidong/trochoimoi.dart';
import 'package:doan_laptrinhdidong/xephang.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(DaiNam());
}

class DaiNam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Một câu nữa thôi', home: KhanGia());
  }
}
