import 'package:flutter/material.dart';

class XepHang extends StatefulWidget {
  @override
  State<XepHang> createState() => _XepHang();
}

class _XepHang extends State<XepHang> {
  List<XH> xephang = [
    XH('Đại Nam', 10, 100),
    XH('RonalDo', 0, 100),
    XH('Messi', 0, 100),
    XH('Neymar', 1, 1000),
    XH('Neymar', 1, 1000)
  ];
  int rank = 0;
  String xhang() {
    rank++;
    return rank.toString();
  }

  get x => xhang();
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
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: xephang.length,
          itemBuilder: (context, index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              // ignore: avoid_print
              leading: CircleAvatar(child: Text(x)),
              title: Text(
                xephang[index].TenNguoiChoi.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                xephang[index].SoCau.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Text(
                xephang[index].SoDiem.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          },
        ),
      ),
    );
    // ignore: dead_code
  }
}

class XH {
  final String TenNguoiChoi;
  final int SoCau;
  final int SoDiem;
  XH(this.TenNguoiChoi, this.SoCau, this.SoDiem);
}
