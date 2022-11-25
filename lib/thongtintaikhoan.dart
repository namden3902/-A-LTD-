import 'package:flutter/material.dart';

String? TenDangNhap;
String? Email;
String? SoDienThoai;
String? MatKhau;
String? MatKhauMoi;

class ThongTinTaiKhoan extends StatefulWidget {
  @override
  State<ThongTinTaiKhoan> createState() => _ThongTinTaiKhoan();
}

class _ThongTinTaiKhoan extends State<ThongTinTaiKhoan> {
  bool _obscureText = true;
  bool __obsureText = true;
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
                    child: Text('Tên đăng nhập:' + TenDangNhap.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: Text(
                    'Email:$Email',
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
                    'Số điện thoại:$SoDienThoai',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    obscureText: _obscureText,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Mật khẩu:',
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
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    obscureText: __obsureText,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Mật khẩu mới:',
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
                              __obsureText = !__obsureText;
                            });
                          },
                          child: Icon(
                            __obsureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        )),
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
                  onPressed: () {
                    Navigator.pop(context);
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
