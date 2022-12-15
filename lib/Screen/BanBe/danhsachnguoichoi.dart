import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/thongtintaikhoan_object.dart';
import 'package:doan_laptrinhdidong/Provider/thongtintaikhoan_provider.dart';
import 'package:flutter/material.dart';

class DanhSach extends StatefulWidget {
  final String? email;
  DanhSach({Key? key, required this.email}) : super(key: key);
  @override
  State<DanhSach> createState() => _DanhSach(email: email);
}

class _DanhSach extends State<DanhSach> {
  CollectionReference loiMoi = FirebaseFirestore.instance.collection('loimoi');
  Future<void> themLoiMoi(String email1, String email2) {
    return loiMoi
        .add({'emailNM': email1.toString(), 'emailNN': email2.toString()});
  }

  List<ThongTinObject> DanhSach = [];
  final String? email;
  _DanhSach({required this.email});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ThongTinObject>>(
      future: ThongTinProvider.banBe(email!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DanhSach = snapshot.data!;
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
                  itemCount: DanhSach.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        title: Text(
                          'Email: ' + DanhSach[index].email,
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
                              title: Text('Thêm bạn bè'),
                              onTap: () {
                                themLoiMoi(email.toString(),
                                    DanhSach[index].email.toString());

                                Navigator.pop(context);
                              },
                            ))
                          ],
                        ));
                  })),
        );
      },
    );
  }
}
