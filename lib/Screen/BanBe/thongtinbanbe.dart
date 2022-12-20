import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Object/thongtintaikhoan_object.dart';
import '../../Provider/thongtintaikhoan_provider.dart';

class ThongTinBanBe extends StatefulWidget {
  String? email;
  ThongTinBanBe({Key? key, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ThongTinBanBe(email: email);
  }
}

class _ThongTinBanBe extends State<ThongTinBanBe> {
  String? email;
  _ThongTinBanBe({Key? key, required this.email});
  int temp1 = 0;
  int temp2 = 0;
  int temp3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return FutureBuilder<List<ThongTinObject>>(
        future: ThongTinProvider.get(email!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ThongTinObject> thongTin = snapshot.data!;
            email = thongTin[0].email;

            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 70),
                          child: Image.asset(
                            'images/logo.png',
                            height: 250,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'THÔNG TIN TÀI KHOẢN',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              readOnly: true,
                              style: const TextStyle(color: Colors.white),
                              onTap: () {
                                temp1 = 1;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    temp1 == 0 ? (thongTin[0].username) : " ",
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.person,
                                    color: Colors.white),
                              ),
                            )),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              onTap: () {
                                temp2 = 0;
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: thongTin[0].email,
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.email,
                                    color: Colors.white),
                              ),
                            )),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              readOnly: true,
                              style: const TextStyle(color: Colors.white),
                              onTap: () {
                                temp1 = 1;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    temp1 == 0 ? (thongTin[0].phone) : " ",
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.phone,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Text('');
        });
  }
}
