import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/lichsu_object.dart';

class LichSuProvider {
  static Future<List<LichSuObject>> get(
    String email,
  ) async {
    List<LichSuObject> LichSu = [];
    final snapshot = await FirebaseFirestore.instance
        .collection("lishsuall")
        .where('email', isEqualTo: email)
        .get();
    LichSu = snapshot.docs
        .map((json) =>
            LichSuObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return LichSu;
  }
}
