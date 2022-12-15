import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Object/thongtintaikhoan_object.dart';
import '../Provider/thongtintaikhoan_provider.dart';

class ThongTinTaiKhoan extends StatefulWidget {
  String? email;
  ThongTinTaiKhoan({Key? key, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ThongTinTaiKhoan(email: email);
  }
}

class _ThongTinTaiKhoan extends State<ThongTinTaiKhoan> {
  String? email;
  _ThongTinTaiKhoan({Key? key, required this.email});
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  int temp1 = 0;
  int temp2 = 0;
  int temp3 = 0;
  var docID;
  var querySnapshots;
  final _formKey = GlobalKey<FormState>();
  CollectionReference user = FirebaseFirestore.instance.collection("users");
  Future<void> updateUser(var docID) {
    return user
        .doc(docID)
        .update({'phone': txtPhone.text, 'username': txtName.text})
        .then((value) => Navigator.pop(context, 'Cập nhật thành công'))
        .catchError(
            (error) => Navigator.pop(context, 'Cập nhật thất bại $error'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return FutureBuilder<List<ThongTinObject>>(
        future: ThongTinProvider.get(email!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ThongTinObject> thongTin = snapshot.data!;
            email = thongTin[0].email;

            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
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
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 70),
                          child: Image.asset(
                            'images/logo.png',
                            height: 250,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'THÔNG TIN TÀI KHOẢN',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: txtName,
                              readOnly: false,
                              style: const TextStyle(color: Colors.white),
                              onTap: () {
                                temp1 = 1;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    temp1 == 0 ? (thongTin[0].username) : " ",
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.person,
                                    color: Colors.white),
                              ),
                            )),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              onTap: () {
                                temp2 = 0;
                              },
                              controller: txtEmail,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: thongTin[0].email,
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.email,
                                    color: Colors.white),
                              ),
                            )),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: txtPhone,
                              readOnly: false,
                              style: const TextStyle(color: Colors.white),
                              onTap: () {
                                temp1 = 1;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    temp1 == 0 ? (thongTin[0].phone) : " ",
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.phone,
                                    color: Colors.white),
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: 200,
                          height: 80,
                          child: OutlinedButton(
                            onPressed: () async {
                              if (txtName.text == "") {
                                final snackBar = SnackBar(
                                    content:
                                        Text('Vui lòng nhập tên đăng nhập '));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                return;
                              } else if (txtPhone.text == "") {
                                final snackBar = SnackBar(
                                    content:
                                        Text('Vui lòng nhập số điện thoại'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                return;
                              } else if (txtPhone.text.length != 10) {
                                final snackBar = SnackBar(
                                    content: Text(
                                        'Số điện thoại chưa đúng định dạng'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                return;
                              } else if (txtPhone.text == thongTin[0].phone &&
                                  txtName.text == thongTin[0].username) {
                                final snackBar = SnackBar(
                                    content: Text(
                                        'Không thể cập nhập vì thông tin không có sự thay đổi !'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                return;
                              } else {
                                try {
                                  querySnapshots = await user.get();
                                  for (var snapshot in querySnapshots.docs) {
                                    if (email == snapshot['email']) {
                                      docID = snapshot.id;
                                    }
                                  }
                                  updateUser(docID);
                                  final snackBar = SnackBar(
                                      content: Text(
                                          'Cập nhập thông tin thành công !'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } catch (e) {
                                  final snackBar = SnackBar(
                                      content: Text('Có lỗi xảy ra !'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: const Text(
                              'Cập nhật',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1.5, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Text('');
        });
  }
}
