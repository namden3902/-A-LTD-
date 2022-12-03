import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/xephang_object.dart';
import 'package:doan_laptrinhdidong/Provider/xephang_provider.dart';
import 'package:flutter/material.dart';

class XepHang extends StatefulWidget {
  final Stream<QuerySnapshot> lichsuall =
      FirebaseFirestore.instance.collection('lichsuall').snapshots();
  @override
  State<XepHang> createState() => _XepHang();
}

class _XepHang extends State<XepHang> {
  List<XepHangObject> xephang = [];

  int rank = 0;
  String xhang() {
    rank++;
    return rank.toString();
  }

  get x => xhang();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<XepHangObject>>(
      future: XepHangProvider.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          xephang = snapshot.data!;
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
              itemCount: xephang.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // ignore: avoid_print
                  leading: CircleAvatar(child: Text(x)),
                  title: Text(
                    'Email người chơi: ' + xephang[index].email.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    'Số câu đúng: ' + xephang[index].soCauDung.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  trailing: Text(
                    xephang[index].soDiem.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
    // ignore: dead_code
  }
}
