import 'package:flutter/material.dart';

class LichSuTroChoi extends StatelessWidget {
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
                  'Lịch sử trò chơi',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      '14:30:21 25/10/2022',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      '14:30:21 25/10/2022',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      '14:30:21 25/10/2022',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      '14:30:21 25/10/2022',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      '14:30:21 25/10/2022',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      '14:30:21 25/10/2022',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
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
