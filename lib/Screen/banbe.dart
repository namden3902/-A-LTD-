import 'package:doan_laptrinhdidong/Screen/danhsachnguoichoi.dart';
import 'package:flutter/material.dart';

class BanBe extends StatefulWidget {
  final String? email;
  BanBe({Key? key, required this.email}) : super(key: key);
  @override
  State<BanBe> createState() => _BanBe(email: email);
}

class _BanBe extends State<BanBe> {
  final String? email;
  _BanBe({Key? key, required this.email});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bạn bè',
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.people),
              ),
              Tab(
                icon: Icon(Icons.person_add),
              ),
              Tab(
                icon: Icon(Icons.person_search_rounded),
              )
            ],
          ),
        ),
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
            // child: _widgetOptions.elementAt(_selectedIndex),
            child: TabBarView(
              children: [
                Icon(Icons.people),
                Icon(Icons.person_add),
                DanhSach(email: email)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
