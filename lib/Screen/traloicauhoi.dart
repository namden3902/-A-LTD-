import 'dart:async';
import 'dart:math';
import 'package:doan_laptrinhdidong/Object/cauhoi_object.dart';
import 'package:doan_laptrinhdidong/Provider/cauhoi_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Screen/manhinhchinh.dart';

import 'credit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TraLoiCauHoi extends StatefulWidget {
  final String? TenLinhVuc;
  final int? idLinhVuc;
  TraLoiCauHoi({this.TenLinhVuc, this.idLinhVuc});
  @override
  State<TraLoiCauHoi> createState() =>
      _TraLoiCauHoi(TenLV: TenLinhVuc, idLinhVuc: idLinhVuc);
}

class _TraLoiCauHoi extends State<TraLoiCauHoi> {
  int SoCau = 1, SoDiem = 0, SoCredit = 0, SoLuotChoi = 5;

  bool NguoiThan = false;
  bool NamMuoi = false;
  bool KhanGia = false;
  bool _isVisibleA = true;
  bool _isVisibleB = true;
  bool _isVisibleC = true;
  bool _isVisibleD = true;

  final Stream<QuerySnapshot> cauhoi =
      FirebaseFirestore.instance.collection('cauhoi').snapshots();
  //Đồng hồ
  static const maxSeconds = 15;
  int seconds = maxSeconds;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds--);
    });
  }

  //Hàm khởi tạo
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void setState(VoidCallback fn) async {
    // TODO: implement setState
    if (seconds == 1) {
      if (SoLuotChoi > 0) {
        SoLuotChoi--;
        seconds = maxSeconds;
      } else {
        timer?.cancel();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text('Thông báo'),
                  content: Text('Bạn đã hết lượt chơi'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Xin cảm ơn'))
                  ]);
            });
      }
    }
    super.setState(fn);
  }

  final String? TenLV;
  late int? idLinhVuc;
  _TraLoiCauHoi({this.TenLV, this.idLinhVuc});
  @override
  Widget build(BuildContext context) {
    //Lấy id lĩnh vự
    int id;
    if (idLinhVuc == 1) {
      id = 1;
    } else if (idLinhVuc == 2) {
      id = 2;
    } else if (idLinhVuc == 3) {
      id = 3;
    } else {
      id = 4;
    }
    String ndcauhoi = "",
        dapanA = "",
        dapanB = "",
        dapanC = "",
        dapanD = "",
        dapanDung = "";
    return FutureBuilder<List<CauHoiObject>>(
      future: CauHoiProvider.get(id, 1, SoCau),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CauHoiObject> CauHoi = snapshot.data!;
          ndcauhoi = CauHoi[0].ndCauHoi;
          dapanA = CauHoi[0].dapanA;
          dapanB = CauHoi[0].dapanB;
          dapanC = CauHoi[0].dapanC;
          dapanD = CauHoi[0].dapanD;
          dapanDung = CauHoi[0].dapanDung;
        }
        return WillPopScope(
            child: Scaffold(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        SoLuotChoi.toString(),
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Credit:' + SoCredit.toString(),
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Credit()));
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
                            'Lĩnh vực: ' + TenLV.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
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
                          SoCau.toString(),
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
                        ndcauhoi,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                      Container(
                          child: Visibility(
                        visible: _isVisibleA,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            dapanA,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 3),
                              fixedSize: Size(280, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Visibility(
                        visible: _isVisibleB,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            dapanB,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 3),
                              fixedSize: Size(280, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Visibility(
                        visible: _isVisibleC,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            dapanC,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 3),
                              fixedSize: Size(280, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Visibility(
                        visible: _isVisibleD,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            dapanD,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 3),
                              fixedSize: Size(280, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => KhanGia(
                              //               SoCauHoi: SoCau,
                              //               SoDiem: SoDiem,
                              //               SoCredit: SoCredit,
                              //             )));
                              if (KhanGia == true) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Bạn đã sử dụng quyền trợ giúp này trong lượt chơi này'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Xin cảm ơn'))
                                        ],
                                      );
                                    });
                              } else {
                                // KhanGia = true;
                                // if (dapanDung.toString() == "A") {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return AlertDialog(
                                //           title: Text('Danh sách đáp án bình chọn'),
                                //           content: Container(
                                //               child: SizedBox(
                                //             height: 90,
                                //             child: Column(
                                //               children: [
                                //                 Text('A: 30%'),
                                //                 Text('B: 26%'),
                                //                 Text('C: 24%'),
                                //                 Text('A: 20%'),
                                //               ],
                                //             ),
                                //           )),
                                //           actions: [
                                //             TextButton(
                                //                 onPressed: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //                 child: Text('Xin cảm ơn'))
                                //           ],
                                //         );
                                //       });
                                // } else if (DA == "B") {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return AlertDialog(
                                //           title: Text('Danh sách đáp án bình chọn'),
                                //           content: Container(
                                //               child: SizedBox(
                                //             height: 90,
                                //             child: Column(
                                //               children: [
                                //                 Text('A: 15%'),
                                //                 Text('B: 45%'),
                                //                 Text('C: 18%'),
                                //                 Text('A: 22%'),
                                //               ],
                                //             ),
                                //           )),
                                //           actions: [
                                //             TextButton(
                                //                 onPressed: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //                 child: Text('Xin cảm ơn'))
                                //           ],
                                //         );
                                //       });
                                // } else if (DA == "A") {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return AlertDialog(
                                //           title: Text('Danh sách đáp án bình chọn'),
                                //           content: Container(
                                //               child: SizedBox(
                                //             height: 90,
                                //             child: Column(
                                //               children: [
                                //                 Text('A: 10%'),
                                //                 Text('B: 16%'),
                                //                 Text('C: 60%'),
                                //                 Text('A: 14%'),
                                //               ],
                                //             ),
                                //           )),
                                //           actions: [
                                //             TextButton(
                                //                 onPressed: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //                 child: Text('Xin cảm ơn'))
                                //           ],
                                //         );
                                //       });
                                // } else if (DA == "A") {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return AlertDialog(
                                //           title: Text('Danh sách đáp án bình chọn'),
                                //           content: Container(
                                //               child: SizedBox(
                                //             height: 90,
                                //             child: Column(
                                //               children: [
                                //                 Text('A: 15%'),
                                //                 Text('B: 25%'),
                                //                 Text('C: 20%'),
                                //                 Text('A: 40%'),
                                //               ],
                                //             ),
                                //           )),
                                //           actions: [
                                //             TextButton(
                                //                 onPressed: () {
                                //                   Navigator.pop(context);
                                //                 },
                                //                 child: Text('Xin cảm ơn'))
                                //           ],
                                //         );
                                //       });
                                // }
                              }
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
                            onPressed: () {
                              if (NamMuoi == true) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Bạn đã sử dụng quyền trợ giúp này trong lượt chơi này'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Xin cảm ơn'))
                                        ],
                                      );
                                    });
                              } else {
                                // NamMuoi = true;
                                // if (DA == "A") {
                                //   setState(() {
                                //     _isVisibleB = !_isVisibleB;
                                //     _isVisibleC = !_isVisibleC;
                                //   });
                                // } else if (DA == "B") {
                                //   setState(() {
                                //     _isVisibleA = !_isVisibleA;
                                //     _isVisibleC = !_isVisibleC;
                                //   });
                                // } else if (DA == "C") {
                                //   setState(() {
                                //     _isVisibleB = !_isVisibleB;
                                //     _isVisibleD = !_isVisibleD;
                                //   });
                                // } else if (DA == "D") {
                                //   setState(() {
                                //     _isVisibleC = !_isVisibleC;
                                //     _isVisibleA = !_isVisibleA;
                                //   });
                                // }
                              }
                            },
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
                            onPressed: () {
                              if (NguoiThan == true) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Thông báo'),
                                        content: Text(
                                            'Bạn đã sử dụng quyền trợ giúp này trong lượt chơi này'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Xin cảm ơn'))
                                        ],
                                      );
                                    });
                              }
                              if (NguoiThan == false) {
                                NguoiThan = true;
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Câu trả lời từ người thân',
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center),
                                        content: Text(
                                          'B',
                                          style: TextStyle(
                                              fontSize: 100,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Xin cảm ơn',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        backgroundColor: Colors.lightBlue,
                                      );
                                    });
                              }
                            },
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
                      buildTimer(),
                      OutlinedButton(
                        onPressed: () {
                          SoCau = SoCau + 1;
                          seconds = maxSeconds;
                          setState(() {
                            _isVisibleA = true;
                            _isVisibleB = true;
                            _isVisibleC = true;
                            _isVisibleD = true;
                          });
                        },
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
            ),
            onWillPop: () async {
              return false;
            });
      },
    );
  }

  Widget buildTime() {
    return Text(
      '$seconds',
      style: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget buildTimer() => SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: seconds / maxSeconds,
              valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
              strokeWidth: 10,
              backgroundColor: Colors.red,
            ),
            Center(child: buildTime())
          ],
        ),
      );
}
