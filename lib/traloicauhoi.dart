import 'dart:async';
import 'package:doan_laptrinhdidong/credit.dart';
import 'package:doan_laptrinhdidong/khangia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TraLoiCauHoi extends StatelessWidget {
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
                                'Credit:500',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => muacredit()));
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
                    'Điểm: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Số điểm',
                    style: TextStyle(color: Colors.white, fontSize: 25),
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
                        'B. Bình Định',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
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
                        'D.Ninh Thuận',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 3),
                          fixedSize: Size(280, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
