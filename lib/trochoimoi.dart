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
              Color.fromARGB(183, 191, 89, 71),
              Color.fromARGB(183, 73, 100, 175),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_mark_sharp,
                  size: 150,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 100,
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
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.abc,
                    size: 24.0,
                  ),
                  label: Text(
                    'Lịch sử - Địa lí Việt Nam',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(275, 50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black12),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.abc,
                    size: 24.0,
                  ),
                  label: Text('Game', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(275, 50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black12),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.abc,
                    size: 24.0,
                  ),
                  label: Text('Hại não', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(275, 50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black12),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.ballot,
                    size: 24.0,
                  ),
                  label: Text('Bóng đá', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(275, 50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
