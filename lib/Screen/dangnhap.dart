import 'dangky.dart';
import 'manhinhchinh.dart';
import 'quenmatkhau.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DangNhap extends StatefulWidget {
  @override
  State<DangNhap> createState() => _DangNhap();
}

class _DangNhap extends State<DangNhap> {
  final _auth = FirebaseAuth.instance;
  bool _obscureText = true;
  final txtEmail = TextEditingController();
  final txtPass = TextEditingController();
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
                  SizedBox(
                    width: 350,
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
                          prefixIcon: Icon(Icons.person, color: Colors.white)),
                      controller: txtEmail,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      obscureText: _obscureText,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Mật khẩu',
                          labelStyle: TextStyle(
                            color: Colors.white, //<-- SEE HERE
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3)),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          )),
                      controller: txtPass,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.white, width: 3), //<-- SEE HERE
                    ),
                    onPressed: () async {
                      if (txtEmail.text == "") {
                        final snackBar = SnackBar(
                            content: Text('Bạn chưa nhập địa chỉ email !'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      //Validate của kiểm thử phần mmềm
                      String temp = txtEmail.toString();
                      if (temp.indexOf("@gmail.com") == -1) {
                        final snackBar = SnackBar(
                            content: Text(
                                'Bạn chưa nhập đúng định dạng của một email !'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (txtPass.text == "") {
                        final snackBar =
                            SnackBar(content: Text('Bạn chưa nhập mật khẩu !'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      if (txtEmail.text != "" && txtPass.text != "") {
                        try {
                          final _user = await _auth.signInWithEmailAndPassword(
                              email: txtEmail.text, password: txtPass.text);
                          _auth.authStateChanges().listen((event) {
                            if (event != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManHinhChinh(
                                            email: txtEmail.text,
                                          )));
                              // txtEmail.clear();
                              // txtPass.clear();
                            } else {
                              final snackBar = SnackBar(
                                  content: Text('Email hoặc mật khẩu ko đúng'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        } catch (e) {
                          final snackBar =
                              SnackBar(content: Text('Lỗi kết nối đến server'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DangKy()));
                      },
                      child: Text('Bạn chưa có tài khoản ?',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ))),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuenMatKhau()))
                            .then((value) {
                          if (value != null) {
                            final snackBar = SnackBar(content: Text(value));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      },
                      child: Text('Quên mật khẩu ?',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ))),
                ],
              ),
            ),
          ),
        )),
        onWillPop: () async {
          return false;
        });
  }
}
