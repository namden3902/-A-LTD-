import 'package:doan_laptrinhdidong/dangky.dart';
import 'package:doan_laptrinhdidong/manhinhchinh.dart';
import 'package:doan_laptrinhdidong/quenmatkhau.dart';
import 'package:flutter/material.dart';

class DangNhap extends StatefulWidget {
  @override
  State<DangNhap> createState() => _DangNhap();
}

class _DangNhap extends State<DangNhap> {
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
              SizedBox(
                width: 350,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Tên đăng nhập',
                      labelStyle: TextStyle(
                        color: Colors.white, //<-- SEE HERE
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3)),
                      prefixIcon: Icon(Icons.person, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  obscureText: true,
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
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side:
                      BorderSide(color: Colors.white, width: 3), //<-- SEE HERE
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManHinhChinh()));
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuenMatKhau()));
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
    ));
  }
}
