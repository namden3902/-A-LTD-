import 'credit.dart';
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white, width: 3),
                    fixedSize: Size(280, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)), //<-- SEE HERE
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
                        borderRadius: BorderRadius.circular(8)), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TroChoiMoi()));
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
                        borderRadius: BorderRadius.circular(8)), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LichSuTroChoi()));
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
                        borderRadius: BorderRadius.circular(8)), //<-- SEE HERE
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
                        borderRadius: BorderRadius.circular(8)), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Credit()));
                  },
                  child: const Text(
                    'Mua credit',
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
                        borderRadius: BorderRadius.circular(8)), //<-- SEE HERE
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Đổi mật khẩu'),
                            content: TextField(
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
                                  onPressed: () {
                                    final user = _auth
                                        ?.updatePassword(txtMatKhauMoi.text);
                                    txtMatKhauMoi.clear();
                                    Navigator.pop(context);
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
                      Navigator.pop(context, 'Đã đăng xuất tài khoản');
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
    );
  }
}
