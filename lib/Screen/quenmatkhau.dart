import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Object/thongtintaikhoan_object.dart';

class QuenMatKhau extends StatefulWidget {
  @override
  State<QuenMatKhau> createState() => _Quenmatkhau();
}

class _Quenmatkhau extends State<QuenMatKhau> {
  final _auth = FirebaseAuth.instance;
  final txtEmail = TextEditingController();
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
                Text(
                  'Quên mật khẩu',
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
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.white, //<-- SEE HERE
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3)),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    controller: txtEmail,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   width: 350,
                //   height: 50,
                //   child: TextField(
                //     keyboardType: TextInputType.number,
                //     style: TextStyle(color: Colors.white),
                //     decoration: InputDecoration(
                //         labelText: 'Số điện thoại',
                //         labelStyle: TextStyle(
                //           color: Colors.white, //<-- SEE HERE
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20),
                //             borderSide:
                //                 BorderSide(color: Colors.white, width: 3)),
                //         prefixIcon: Icon(
                //           Icons.phone,
                //           color: Colors.white,
                //         )),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   width: 350,
                //   height: 50,
                //   child: TextField(
                //     obscureText: true,
                //     style: TextStyle(color: Colors.white),
                //     decoration: InputDecoration(
                //         labelText: 'Mật khẩu mới',
                //         labelStyle: TextStyle(
                //           color: Colors.white, //<-- SEE HERE
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20),
                //             borderSide:
                //                 BorderSide(color: Colors.white, width: 3)),
                //         prefixIcon: Icon(
                //           Icons.password,
                //           color: Colors.white,
                //         )),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   width: 350,
                //   height: 50,
                //   child: TextField(
                //     obscureText: true,
                //     style: TextStyle(color: Colors.white),
                //     decoration: InputDecoration(
                //         labelText: 'Nhập lại mật khẩu',
                //         labelStyle: TextStyle(
                //           color: Colors.white, //<-- SEE HERE
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20),
                //             borderSide:
                //                 BorderSide(color: Colors.white, width: 3)),
                //         prefixIcon: Icon(
                //           Icons.password,
                //           color: Colors.white,
                //         )),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white, width: 3),
                    fixedSize: Size(100, 40), //<-- SEE HERE
                  ),
                  onPressed: () async {
                    if (txtEmail.text == "") {
                      final snackBar = SnackBar(
                          content: Text('Bạn chưa nhập địa chỉ email'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    } else if ((txtEmail.text).indexOf("@gmail.com") == -1) {
                      final snackBar =
                          SnackBar(content: Text('Email chưa đúng định dạng'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    } else {
                      try {
                        final _user = await _auth.sendPasswordResetEmail(
                            email: txtEmail.text);
                        Navigator.pop(context,
                            'Gửi liên kết đặt lại mật khẩu thành công');
                      } catch (e) {
                        final snackBar =
                            SnackBar(content: Text('Email chưa được đăng ký'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: const Text(
                    'Đặt lại',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
