import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/danhsachbb_object.dart';
import 'package:doan_laptrinhdidong/Object/loimoi_object.dart';
import 'package:doan_laptrinhdidong/Object/thongtintaikhoan_object.dart';
import 'package:doan_laptrinhdidong/Provider/danhsachbb_provider.dart';
import 'package:doan_laptrinhdidong/Provider/loimoi_provider.dart';
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
  List<DSBanBeObject> danhSachTemp = [];
  List<LoiMoiObject> dsloimoiTemp = [];
  List<LoiMoiObject> dsloimoiTemp2 = [];
  bool dieuKien = true;
  bool dieuKien2 = true;
  bool dieuKien3 = true;
  void _loadDSHT() async {
    final data = await DSBanBeProvider.getDS(email!);
    setState(() {});
    danhSachTemp = data;
  }

  void _loadDSLM(String email1, String email2) async {
    final data = await LoiMoiProvider.getLMHT(email1, email2);
    setState(() {});
    dsloimoiTemp = data;
  }

  void _loadDSLM2(String email1, String email2) async {
    final data = await LoiMoiProvider.getLMHT(email1, email2);
    setState(() {});
    dsloimoiTemp2 = data;
  }

  @override
  void initState() {
    super.initState();
    _loadDSHT();
  }

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
                          'Server: Tr??i ?????t',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: ListTile(
                              leading: Icon(Icons.person_add),
                              title: Text('Th??m b???n b??'),
                              onTap: () {
                                _loadDSLM(email!, DanhSach[index].email);
                                _loadDSLM2(DanhSach[index].email, email!);
                                for (int i = 0; i < danhSachTemp.length; i++) {
                                  if (danhSachTemp[i].email2 ==
                                      DanhSach[index].email.toString()) {
                                    dieuKien = false;
                                  }
                                }
                                for (int i = 0; i < dsloimoiTemp.length; i++) {
                                  if (dsloimoiTemp[index].emailNM == email &&
                                      dsloimoiTemp[index].emailNN ==
                                          DanhSach[index].email.toString()) {
                                    dieuKien2 = false;
                                  }
                                }
                                for (int i = 0; i < dsloimoiTemp2.length; i++) {
                                  if (dsloimoiTemp2[index].emailNN == email &&
                                      dsloimoiTemp2[index].emailNM ==
                                          DanhSach[index].email.toString()) {
                                    dieuKien3 = false;
                                  }
                                }
                                if (dieuKien == false) {
                                  final snackbar = SnackBar(
                                      content: Text(
                                          'B???n v???i ng?????i n??y hi???n ???? l?? b???n b??'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                  dieuKien = true;
                                  return;
                                }
                                if (dieuKien2 == false) {
                                  final snackbar = SnackBar(
                                      content: Text(
                                          'B???n ???? g???i l???i m???i ?????n ng?????i ch??i n??y'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                  dieuKien2 = true;
                                  return;
                                }
                                if (dieuKien3 == false) {
                                  final snackbar = SnackBar(
                                      content: Text(
                                          'Ng?????i ch??i n??y hi???n ???? g???i l???i m???i k???t b???n v???i b???n'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                  dieuKien3 = true;
                                  return;
                                }
                                themLoiMoi(email.toString(),
                                    DanhSach[index].email.toString());
                                final snackbar = SnackBar(
                                    content: Text('Th??m l???i m???i th??nh c??ng !'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
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
