import 'dart:async';
import 'package:doan_laptrinhdidong/traloicauhoi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'credit.dart';

class KhanGia extends StatefulWidget {
  final int? SoCauHoi;
  final int? SoDiem;
  final int? SoCredit;
  KhanGia({this.SoCauHoi, this.SoDiem, this.SoCredit});
  @override
  State<KhanGia> createState() => _KhanGia();
}

class _KhanGia extends State<KhanGia> {
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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Card(
                child: Container(
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.heart_broken,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.heart_broken,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.heart_broken,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.heart_broken,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.heart_broken,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Credit' + SoCredit.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Credit()));
                                  },
                                  icon: Icon(
                                    Icons.shop,
                                    color: Colors.white,
                                  ))
                            ],
                          )
                        ])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Điểm: ' + SoDiem.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lĩnh vực: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Lịch sử - địa lí Việt Nam',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
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
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                height: 75,
                width: 75,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Đảo Phú Quý thuộc tỉnh nào ?',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'A. Bình Thuận',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Text(
                      ' %',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'B. Bình Thuận',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Text(
                      ' %',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'C. Bình Phước',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Text(
                      ' %',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'D. Ninh Thuận',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Text(
                      ' %',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KhanGia()));
                    },
                    child: Icon(
                      Icons.people,
                      color: Colors.white,
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.balance,
                      color: Colors.white,
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 3),
                        fixedSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white, width: 3),
                    fixedSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
