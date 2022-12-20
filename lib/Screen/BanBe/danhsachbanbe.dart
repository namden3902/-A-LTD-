import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/danhsachbb_object.dart';
import 'package:doan_laptrinhdidong/Provider/danhsachbb_provider.dart';
import 'package:doan_laptrinhdidong/Screen/BanBe/thongtinbanbe.dart';
import 'package:flutter/material.dart';

class DanhSachBB extends StatefulWidget {
  final String? email;
  DanhSachBB({Key? key, required this.email}) : super(key: key);
  @override
  State<DanhSachBB> createState() => _DanhSachBB(email: email);
}

class _DanhSachBB extends State<DanhSachBB> {
  var querySnapshots;
  var docID;
  final snackbar = SnackBar(content: Text('Xóa bạn bè thành công !'));
  final snackbar2 =
      SnackBar(content: Text('Xóa không thành công bạn bè không thành công !'));
  CollectionReference banbe = FirebaseFirestore.instance.collection('banbe');
  Future<void> xoaBanBe(var docID) {
    return banbe
        .doc(docID)
        .delete()
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar))
        .catchError(
            (error) => ScaffoldMessenger.of(context).showSnackBar(snackbar2));
  }

  List<DSBanBeObject> DanhSach = [];
  final String? email;
  _DanhSachBB({required this.email});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DSBanBeObject>>(
      future: DSBanBeProvider.getDS(email!),
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
                          'Email: ' + DanhSach[index].email2.toString(),
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
                              title: Text('Xóa bạn bè'),
                              onTap: () async {
                                querySnapshots = await banbe.get();
                                for (var snapshot in querySnapshots.docs) {
                                  if (email == snapshot['email1']) {
                                    docID = snapshot.id;
                                    xoaBanBe(docID);
                                  }
                                  if (email == snapshot['email2']) {
                                    docID = snapshot.id;
                                    xoaBanBe(docID);
                                  }
                                }
                                setState(() {});
                                Navigator.pop(context);
                              },
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              leading: Icon(Icons.perm_device_information),
                              title: Text('Xem thông tin'),
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThongTinBanBe(
                                          email: DanhSach[index]
                                              .email2
                                              .toString())),
                                );
                              },
                            )),
                          ],
                        ));
                  })),
        );
      },
    );
  }
}
