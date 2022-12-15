import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doan_laptrinhdidong/Object/xephang_object.dart';

class XepHangProvider {
  static Future<List<XepHangObject>> get() async {
    List<XepHangObject> LichSu = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("lishsuall")
        .orderBy("soDiem", descending: true)
        .limit(5)
        .get();
    LichSu = snapshot.docs
        .map((json) =>
            XepHangObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return LichSu;
  }
}
