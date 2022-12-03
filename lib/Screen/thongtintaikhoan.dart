import 'package:doan_laptrinhdidong/Provider/thongtintaikhoan_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/thongtintaikhoan_object.dart';

// String? TenDangNhap;
// String? Email;
// String? SoDienThoai;
// String? MatKhau;
// String? MatKhauMoi;

class ThongTinTaiKhoan extends StatefulWidget {
  String email;
  ThongTinTaiKhoan({Key? key, required this.email}) : super(key: key);
  @override
  State<ThongTinTaiKhoan> createState() => _ThongTinTaiKhoan(email: email);
}

class _ThongTinTaiKhoan extends State<ThongTinTaiKhoan> {
  String email;
  _ThongTinTaiKhoan({Key? key, required this.email});
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  bool _obscureText = true;
  bool __obsureText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String username = "";
    String phone = "";
    return FutureBuilder<List<ThongTinObject>>(
      future: ThongTinProvider.get(email),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ThongTinObject> thongtin = snapshot.data!;
          email = thongtin[0].email;
          phone = thongtin[0].phone;
          username = thongtin[0].username;
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
                    'Thông tin tài khoản  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 350,
                      height: 50,
                      // ignore: prefer_interpolation_to_compose_strings
                      child: Text('Tên đăng nhập: ' + username.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18))),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: Text(
                      'Email: ' + email,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: Text(
                      'Số điện thoại: ' + phone.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
