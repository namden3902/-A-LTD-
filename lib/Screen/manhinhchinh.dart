import 'package:doan_laptrinhdidong/Screen/dangnhap.dart';

import 'lichsutrochoi.dart';
import 'thongtintaikhoan.dart';
import 'trochoimoi.dart';
import 'xephang.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManHinhChinh extends StatefulWidget {
  String email;
  ManHinhChinh({Key? key, required this.email}) : super(key: key);
  @override
  State<ManHinhChinh> createState() => _ManHinhChinh(email: email);
}

class _ManHinhChinh extends State<ManHinhChinh> {
  String email;
  _ManHinhChinh({Key? key, required this.email});
  final _auth = FirebaseAuth.instance.currentUser;
  final txtMatKhauMoi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        'images/logo.png',
                        height: 250,
                      ),
                    ),
                    Text(
                      'Xin chào:' + email.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(280, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), //<-- SEE HERE
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThongTinTaiKhoan(
                                      email: email,
                                    )));
                      },
                      child: const Text(
                        'Thông tin tài khoản',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(280, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), //<-- SEE HERE
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TroChoiMoi(
                                      email: email,
                                    )));
                      },
                      child: const Text(
                        'Trò chơi mới',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(280, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), //<-- SEE HERE
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LichSuTroChoi(
                                      email: email,
                                    )));
                      },
                      child: const Text(
                        'Lịch sử trò chơi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(280, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), //<-- SEE HERE
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => XepHang()));
                      },
                      child: const Text(
                        'Bảng xếp hạng',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(280, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), //<-- SEE HERE
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Đổi mật khẩu'),
                                content: TextField(
                                  obscureText: true,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: 'Mật khẩu',
                                    labelStyle: TextStyle(
                                      color: Colors.black, //<-- SEE HERE
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 3)),
                                  ),
                                  controller: txtMatKhauMoi,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () async {
                                        if (txtMatKhauMoi.text == "") {
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  'Bạn chưa nhập mật khẩu'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          return;
                                        } else if (txtMatKhauMoi.text.length <
                                                8 ||
                                            txtMatKhauMoi.text.length > 16) {
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  'Mật khẩu phải có ít nhất 8 kí tự và không quá 16 kí tự'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          return;
                                        } else {
                                          final user =
                                              await _auth?.updatePassword(
                                                  txtMatKhauMoi.text);
                                          txtMatKhauMoi.clear();
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text('Đổi mật khẩu'))
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Đổi mật khẩu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DangNhap()));
                        },
                        child: Text('Đăng xuất',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontSize: 18))),
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
