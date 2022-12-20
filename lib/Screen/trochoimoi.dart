import 'package:doan_laptrinhdidong/Object/cauhoi_object.dart';
import 'package:doan_laptrinhdidong/Provider/cauhoi_provider.dart';

import 'traloicauhoi.dart';
import 'package:flutter/material.dart';

class TroChoiMoi extends StatefulWidget {
  final String? email;
  TroChoiMoi({Key? key, required this.email}) : super(key: key);
  @override
  State<TroChoiMoi> createState() => _TroChoiMoi(email: email);
}

class _TroChoiMoi extends State<TroChoiMoi> {
  late String? TenLinhVuc;
  final String? email;
  _TroChoiMoi({this.TenLinhVuc, this.email});
  List<CauHoiObject> cauHoi = [];

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        'images/logo.png',
                        height: 250,
                      ),
                    ),
                    Text(
                      'Trò chơi mới',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Chọn một trong các lĩnh vực sau',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        cauHoi = [];
                        TenLinhVuc = 'Lịch sử - Địa lí Việt Nam';
                        final data = await CauHoiProvider.getfull(1);
                        cauHoi = data;
                        if (cauHoi.length != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TraLoiCauHoi(
                                        TenLinhVuc: TenLinhVuc,
                                        idLinhVuc: 1,
                                        email: email,
                                      )));
                          return;
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Lĩnh vực hiện chưa có dữ liệu '));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                      },
                      child: const Text(
                        'Lịch sử - Địa lí Việt Nam',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        TenLinhVuc = 'Game';
                        final data = await CauHoiProvider.getfull(2);
                        cauHoi = data;
                        if (cauHoi.length != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TraLoiCauHoi(
                                        TenLinhVuc: TenLinhVuc,
                                        idLinhVuc: 2,
                                        email: email,
                                      )));
                          return;
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Lĩnh vực hiện chưa có dữ liệu '));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                      },
                      child: const Text(
                        'Game',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        TenLinhVuc = 'Hại não';
                        final data = await CauHoiProvider.getfull(3);
                        cauHoi = data;
                        if (cauHoi.length != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TraLoiCauHoi(
                                        TenLinhVuc: TenLinhVuc,
                                        idLinhVuc: 3,
                                        email: email,
                                      )));
                          return;
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Lĩnh vực hiện chưa có dữ liệu '));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                      },
                      child: const Text(
                        'Hại não',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        TenLinhVuc = 'Bóng đá';
                        final data = await CauHoiProvider.getfull(4);
                        cauHoi = data;
                        if (cauHoi.length != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TraLoiCauHoi(
                                        TenLinhVuc: TenLinhVuc,
                                        idLinhVuc: 4,
                                        email: email,
                                      )));
                          return;
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Lĩnh vực hiện chưa có dữ liệu '));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                      },
                      child: const Text(
                        'Bóng đá',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
