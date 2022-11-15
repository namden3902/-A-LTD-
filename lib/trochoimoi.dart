import 'dart:ui';

import 'package:flutter/material.dart';

class TroChoiMoi extends StatelessWidget {
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
    );
  }
}
