import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/thongtintaikhoan_object.dart';
import 'package:doan_laptrinhdidong/Screen/main.dart';

class ThongTinProvider {
  static Future<List<ThongTinObject>> get(String email) async {
    List<ThongTinObject> ThongTin = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    ThongTin = snapshot.docs
        .map((json) =>
            ThongTinObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return ThongTin;
  }

  //Lấy thông tin toàn bộ người chơi
  static Future<List<ThongTinObject>> getData() async {
    List<ThongTinObject> ThongTin = [];
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    ThongTin = snapshot.docs
        .map((json) =>
            ThongTinObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return ThongTin;
  }

  //Lấy thông tin có loại trừ
  static Future<List<ThongTinObject>> banBe(String email) async {
    List<ThongTinObject> ThongTin = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isNotEqualTo: email)
        .get();
    ThongTin = snapshot.docs
        .map((json) =>
            ThongTinObject.fromJson(json.data() as Map<String, dynamic>))
        .toList();
    return ThongTin;
  }
}
