import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/loimoi_object.dart';

class LoiMoiProvider {
  static Future<List<LoiMoiObject>> getLoiMoi(String emailNN) async {
    List<LoiMoiObject> loiMoi = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('loimoi')
        .where('emailNN', isEqualTo: emailNN)
        .get();
    loiMoi = snapshot.docs
        .map((json) =>
            LoiMoiObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return loiMoi;
  }

  static Future<List<LoiMoiObject>> getLMHT(
      String emailNM, String emailNN) async {
    List<LoiMoiObject> loiMoi = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('loimoi')
        .where('emailNN', isEqualTo: emailNN)
        .where('emailNM', isEqualTo: emailNM)
        .get();
    loiMoi = snapshot.docs
        .map((json) =>
            LoiMoiObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return loiMoi;
  }
}
