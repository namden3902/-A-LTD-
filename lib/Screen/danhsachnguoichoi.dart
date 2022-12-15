import 'package:doan_laptrinhdidong/Object/thongtintaikhoan_object.dart';
import 'package:doan_laptrinhdidong/Provider/thongtintaikhoan_provider.dart';
import 'package:flutter/material.dart';

class DanhSach extends StatefulWidget {
  final String? email;
  DanhSach({Key? key, required this.email}) : super(key: key);
  @override
  State<DanhSach> createState() => _DanhSach(email: email);
}

class _DanhSach extends State<DanhSach> {
  List<ThongTinObject> DanhSach = [];
  final String? email;
  _DanhSach({required this.email});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ThongTinObject>>(
      future: ThongTinProvider.banBe(email!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DanhSach = snapshot.data!;
        }
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
                  itemCount: DanhSach.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Email:' + DanhSach[index].email),
                      subtitle: Text('Server: Trái đất'),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    );
                  })),
        );
      },
    );
  }
}
