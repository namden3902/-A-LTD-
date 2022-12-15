import 'package:cloud_firestore/cloud_firestore.dart';

import '../Object/danhsachbb_object.dart';

class DSBanBeProvider {
  static Future<List<DSBanBeObject>> getDS(String email) async {
    List<DSBanBeObject> dsBB = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('banbe')
        .where('email1', isEqualTo: email)
        .get();
    dsBB = snapshot.docs
        .map((json) =>
            DSBanBeObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return dsBB;
  }
}
