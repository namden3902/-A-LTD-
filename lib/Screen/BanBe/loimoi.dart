import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/loimoi_object.dart';
import 'package:doan_laptrinhdidong/Provider/loimoi_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoiMoi extends StatefulWidget {
  final String? email;
  LoiMoi({Key? key, required this.email}) : super(key: key);
  @override
  State<LoiMoi> createState() => _LoiMoi(email: email);
}

class _LoiMoi extends State<LoiMoi> {
  final db = FirebaseFirestore.instance;
  List<LoiMoiObject> loiMoi = [];
  CollectionReference banBe = FirebaseFirestore.instance.collection('banbe');
  Future<void> xacNhan(String email1, String email2) {
    return banBe
        .add({'email1': email1.toString(), 'email2': email2.toString()});
  }

  final String? email;
  _LoiMoi({required this.email});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LoiMoiObject>>(
      future: LoiMoiProvider.getLoiMoi(email!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          loiMoi = snapshot.data!;
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
                  itemCount: loiMoi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        title: Text(
                          'Email: ' + loiMoi[index].emailNM.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        subtitle: Text(
                          'Server: Trái đất',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: ListTile(
                                    leading: Icon(Icons.person_add),
                                    title: Text('Xác nhận'),
                                    onTap: () {
                                      xacNhan(email.toString(),
                                          loiMoi[index].emailNM.toString());
                                      xacNhan(loiMoi[index].emailNM.toString(),
                                          email.toString());
                                      Navigator.pop(context);
                                    }))
                          ],
                        ));
                  })),
        );
      },
    );
  }
}
