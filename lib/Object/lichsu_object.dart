import 'package:cloud_firestore/cloud_firestore.dart';

class LichSuObject {
  final String? email;
  final int? soCauDung;
  final int? soDiem;
  final Timestamp? thoiGian;

  LichSuObject({this.email, this.soCauDung, this.soDiem, this.thoiGian});

  LichSuObject.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        soCauDung = json['soCauDung'],
        soDiem = json['soDiem'],
        thoiGian = json['thoiGian'];
  Map<String, Object?> toJson() {
    return {
      'email': email,
      'soCauDung': soCauDung,
      'soDiem': soDiem,
      'thoiGian': thoiGian,
    };
  }
}
