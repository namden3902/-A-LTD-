import 'package:flutter/material.dart';

class XepHang extends StatelessWidget {
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
                Text(
                  'Bảng xếp hạng',
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
                    leading: CircleAvatar(
                      child: const Text(
                        '1',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    title: const Text(
                      'Tên người chơi',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: CircleAvatar(
                      child: const Text(
                        '2',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    title: const Text(
                      'Tên người chơi',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: CircleAvatar(
                      child: const Text(
                        '3',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    title: const Text(
                      'Tên người chơi',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: CircleAvatar(
                      child: const Text(
                        '4',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    title: const Text(
                      'Tên người chơi',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: const Text(
                      'Số câu: 10',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: CircleAvatar(
                      child: const Text(
                        '5',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    title: const Text(
                      'Tên người chơi',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: const Text(
                      'Số câu: 11',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: const Text('2490 điểm',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
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
