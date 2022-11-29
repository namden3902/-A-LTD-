import 'package:flutter/material.dart';
import 'credit.dart';

int SoCredit = 0;

class LichSuTroChoi extends StatefulWidget {
  State<LichSuTroChoi> createState() => _LichSuTroChoi();
}

class _LichSuTroChoi extends State<LichSuTroChoi> {
  List<LichSu> LS = [
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
    LichSu('18:30 25/10/2022', 10, 100),
  ];
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
        itemCount: LS.length,
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text(
              LS[index].ThoiGianChoi.toString(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              LS[index].SoCau.toString(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: Text(
              LS[index].SoDiem.toString(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        },
      ),
    ));
  }
}

class LichSu {
  final String ThoiGianChoi;
  final int SoCau;
  final int SoDiem;
  LichSu(this.ThoiGianChoi, this.SoCau, this.SoDiem);
}
