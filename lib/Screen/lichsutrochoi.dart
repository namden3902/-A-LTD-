import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/lichsu_object.dart';
import 'package:doan_laptrinhdidong/Provider/lichsu_provider.dart';
import 'package:flutter/material.dart';

int SoCredit = 0;

class LichSuTroChoi extends StatefulWidget {
  String? email;
  LichSuTroChoi({Key? key, required this.email}) : super(key: key);
  final Stream<QuerySnapshot> lichsuall =
      FirebaseFirestore.instance.collection('lichsuall').snapshots();
  State<LichSuTroChoi> createState() => _LichSuTroChoi(email: email);
}

class _LichSuTroChoi extends State<LichSuTroChoi> {
  List<LichSuObject> LS = [];
  String? email;
  _LichSuTroChoi({Key? key, required this.email});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LichSuObject>>(
      future: LichSuProvider.get(email.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          LS = snapshot.data!;
        }
        return Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: <Color>[
                Color.fromARGB(183, 255, 38, 0),
                Color.fromARGB(183, 0, 68, 255),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: LS.length,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text(
                  'Thời gian chơi: ' + LS[index].thoiGian.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                subtitle: Text(
                  'Số câu trả lời: ' + LS[index].soCauDung.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                trailing: Text(
                  LS[index].soDiem.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              );
            },
          ),
        ));
        ;
      },
    );
  }
}
