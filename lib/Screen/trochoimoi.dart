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
                      onPressed: () {
                        TenLinhVuc = 'Lịch sử - Địa lí Việt Nam';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TraLoiCauHoi(
                                      TenLinhVuc: TenLinhVuc,
                                      idLinhVuc: 1,
                                      email: email,
                                    )));
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
                      onPressed: () {
                        TenLinhVuc = 'Game';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TraLoiCauHoi(
                                      TenLinhVuc: TenLinhVuc,
                                      idLinhVuc: 2,
                                      email: email,
                                    )));
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
                      onPressed: () {
                        TenLinhVuc = 'Hại não';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TraLoiCauHoi(
                                      TenLinhVuc: TenLinhVuc,
                                      idLinhVuc: 3,
                                      email: email,
                                    )));
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
                      onPressed: () {
                        TenLinhVuc = 'Bóng đá';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TraLoiCauHoi(
                                      idLinhVuc: 4,
                                      email: email,
                                    )));
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
