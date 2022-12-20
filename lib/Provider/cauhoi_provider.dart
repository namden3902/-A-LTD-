import 'dart:convert';

import 'package:doan_laptrinhdidong/Object/cauhoi_object.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CauHoiProvider {
  static Future<List<CauHoiObject>> get(
      int idLinhVuc, int idGoiCauHoi, int idCauHoi) async {
    List<CauHoiObject> CauHoi = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('cauhoi')
        .where('idCauHoi', isEqualTo: idCauHoi)
        .where('idLinhVuc', isEqualTo: idLinhVuc)
        .where('idGoiCauHoi', isEqualTo: idGoiCauHoi)
        .get();
    CauHoi = snapshot.docs
        .map((json) =>
            CauHoiObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return CauHoi;
  }

  static Future<List<CauHoiObject>> getfull(int idLinhVuc) async {
    List<CauHoiObject> CauHoi = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('cauhoi')
        .where('idLinhVuc', isEqualTo: idLinhVuc)
        .get();
    CauHoi = snapshot.docs
        .map((json) =>
            CauHoiObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return CauHoi;
  }
}
