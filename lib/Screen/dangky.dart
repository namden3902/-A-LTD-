import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Object/thongtintaikhoan_object.dart';
import 'package:doan_laptrinhdidong/Provider/thongtintaikhoan_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DangKy extends StatefulWidget {
  @override
  State<DangKy> createState() => _DangKy();
}

int Credit = 100;

class _DangKy extends State<DangKy> {
  CollectionReference usERS = FirebaseFirestore.instance.collection('users');
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtRWPass = TextEditingController();
  List<ThongTinObject> TT = [];
  final _auth = FirebaseAuth.instance;
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return usERS
        .add({
          'email': txtEmail.text,
          'phone': txtPhone.text,
          'username': txtUsername.text,
          'credit': Credit,
        })
        .then((value) => Navigator.pop(context, 'Đăng ký thành công'))
        .catchError(
            (error) => Navigator.pop(context, 'Đăng ký thất bại $error'));
  }

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
                  'Đăng ký',
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
                    decoration: InputDecoration(
                        labelText: 'Tên đăng nhập',
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
                        )),
                    controller: txtUsername,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
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
                          Icons.mail,
                          color: Colors.white,
                        )),
                    controller: txtEmail,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Số điện thoại',
                        labelStyle: TextStyle(
                          color: Colors.white, //<-- SEE HERE
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.white, width: 3)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        )),
                    controller: txtPhone,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
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
                    controller: txtPass,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Nhập lại mật khẩu',
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
                    controller: txtRWPass,
                  ),
                ),
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
                    try {
                      //Note : Phaanf kiem tra validate cua ktpm
                      if (txtUsername.text == "") {
                        final snackBar = SnackBar(
                            content: Text('Ban chua nhap ten dang nhap'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        List<ThongTinObject> TT = [];
                        TT =
                            ThongTinProvider.getUsername(txtUsername.toString())
                                as List<ThongTinObject>;
                        if (TT.length != 0) {
                          final snackBar = SnackBar(
                              content: Text('Ten dang nhap da ton tai'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                      final newUser = _auth.createUserWithEmailAndPassword(
                          email: txtEmail.text, password: txtPass.text);
                      if (txtPass.text == txtRWPass.text) {
                        if (newUser != null) {
                          Navigator.pop(context, 'Đăng ký thành công');
                          addUser();
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Tài khoản này đã tồn tại'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    } catch (e) {
                      final snackBar = SnackBar(
                          content:
                              Text('Không ổn rồi Đại Vương ơi! Có lỗi.......'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text(
                    'Đăng ký',
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
