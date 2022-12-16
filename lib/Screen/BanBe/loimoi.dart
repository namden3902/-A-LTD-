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
  var querySnapshots;
  var docID;
  List<LoiMoiObject> loiMoi = [];
  CollectionReference banBe = FirebaseFirestore.instance.collection('banbe');
  Future<void> xacNhan(String email1, String email2) {
    return banBe
        .add({'email1': email1.toString(), 'email2': email2.toString()});
  }

  CollectionReference loiMoiii =
      FirebaseFirestore.instance.collection('loimoi');
  final snackbar = SnackBar(content: Text('Thêm bạn bè thành công !'));
  final snackbar2 = SnackBar(content: Text('Thêm bạn bè không thành công !'));
  Future<void> xoaLoiMoi(var docID) {
    return loiMoiii
        .doc(docID)
        .delete()
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
        .catchError(
            (error) => ScaffoldMessenger.of(context).showSnackBar(snackbar2));
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
                                    onTap: () async {
                                      xacNhan(email.toString(),
                                          loiMoi[index].emailNM.toString());
                                      xacNhan(loiMoi[index].emailNM.toString(),
                                          email.toString());
                                      querySnapshots = await loiMoiii.get();
                                      for (var snapshot
                                          in querySnapshots.docs) {
                                        if (email == snapshot['emailNN']) {
                                          docID = snapshot.id;
                                        }
                                      }
                                      xoaLoiMoi(docID);
                                      setState(() {});
                                      Navigator.pop(context);
                                    })),
                            PopupMenuItem(
                                child: ListTile(
                                    leading: Icon(Icons.person_add),
                                    title: Text('Xóa lời mời'),
                                    onTap: () async {
                                      querySnapshots = await loiMoiii.get();
                                      for (var snapshot
                                          in querySnapshots.docs) {
                                        if (email == snapshot['emailNN']) {
                                          docID = snapshot.id;
                                        }
                                      }
                                      xoaLoiMoi(docID);
                                      setState(() {});
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
