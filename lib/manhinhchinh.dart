import 'package:doan_laptrinhdidong/credit.dart';
import 'package:doan_laptrinhdidong/lichsutrochoi.dart';
import 'package:doan_laptrinhdidong/thongtintaikhoan.dart';
import 'package:doan_laptrinhdidong/trochoimoi.dart';
import 'package:doan_laptrinhdidong/xephang.dart';
import 'package:flutter/material.dart';

class ManHinhChinh extends StatefulWidget {
  @override
  State<ManHinhChinh> createState() => _ManHinhChinh();
}

class _ManHinhChinh extends State<ManHinhChinh> {
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
                            builder: (context) => ThongTinTaiKhoan()));
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
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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
