import 'dart:async';
import 'dart:math';
import 'package:doan_laptrinhdidong/Object/cauhoi_object.dart';
import 'package:doan_laptrinhdidong/Provider/cauhoi_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_laptrinhdidong/Screen/manhinhchinh.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TraLoiCauHoi extends StatefulWidget {
  final String? TenLinhVuc;
  final int? idLinhVuc;
  final String? email;
  TraLoiCauHoi({this.TenLinhVuc, this.idLinhVuc, this.email});
  @override
  State<TraLoiCauHoi> createState() =>
      _TraLoiCauHoi(TenLV: TenLinhVuc, idLinhVuc: idLinhVuc, email: email);
}

class _TraLoiCauHoi extends State<TraLoiCauHoi> {
  static List<String> _CauHoi = [];
  int dapanDung = 0;
  CollectionReference lichSuALL =
      FirebaseFirestore.instance.collection('lishsuall');
  Future<void> addHS() {
    return lichSuALL.add({
      'email': email.toString(),
      'soCauDung': SoCauDung,
      'soDiem': SoDiem,
      'thoiGian': now,
    });
  }

  //Khai báo gốc
  int SoCau = 1,
      SoDiem = 0,
      SoCredit = 0,
      SoLuotChoi = 3,
      SoCauHoiCuaGoi = 25,
      SoCauDung = 0;
  String dapAn = '';
  bool NguoiThan = false;
  bool NamMuoi = false;
  bool KhanGia = false;
  bool Skip = false;
  bool _isVisibleA = true;
  bool _isVisibleB = true;
  bool _isVisibleC = true;
  bool _isVisibleD = true;
  String now = DateTime.now().toString();
  List<CauHoiObject> cauHoi = [];

  List<Color> optionsColor1 = [
    Colors.white,
  ];
  List<Color> optionsColor2 = [
    Colors.white,
  ];
  List<Color> optionsColor3 = [
    Colors.white,
  ];
  List<Color> optionsColor4 = [
    Colors.white,
  ];
  resetColors() {
    optionsColor1 = [
      Colors.white,
    ];
    optionsColor2 = [
      Colors.white,
    ];
    optionsColor3 = [
      Colors.white,
    ];
    optionsColor4 = [
      Colors.white,
    ];
  }

  //Chia % khán giả
  static int c1 = Random().nextInt(60) + 15;
  static int c2 = Random().nextInt((100 - c1) + 1);
  static int c3 = Random().nextInt((100 - c1 - c2) + 1);
  static int c4 = 100 - c1 - c2 - c3;

  final Stream<QuerySnapshot> cauhoi =
      FirebaseFirestore.instance.collection('cauhoi').snapshots();
  //Đồng hồ
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds--);
    });
  }

  void cau25Dung() {
    SoCau = 25;
    timer?.cancel();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    addHS();
    Future.delayed(const Duration(seconds: 3), () {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Kết thúc trò chơi'),
              content: Text('Số điểm của bạn: ${SoDiem}'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ManHinhChinh(email: email.toString()),
                        ),
                      );
                    },
                    child: Text('Màn hình chính'))
              ],
            );
          });
    });
  }

  void cau25Sai() {
    SoCau = 25;
    SoLuotChoi--;
    timer?.cancel();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    addHS();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Kết thúc trò chơi'),
            content: Text('Số điểm của bạn: ${SoDiem}'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ManHinhChinh(email: email.toString()),
                      ),
                    );
                  },
                  child: Text('Màn hình chính'))
            ],
          );
        });
  }

  void luotChoi() {
    timer?.cancel();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    addHS();
    Future.delayed(const Duration(seconds: 3), () {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Kết thúc trò chơi'),
              content: Text('Số điểm của bạn: ${SoDiem}'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ManHinhChinh(email: email.toString()),
                        ),
                      );
                    },
                    child: Text('Màn hình chính'))
              ],
            );
          });
    });
  }

  //Hàm khởi tạo
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void chuyenCauHoi() {
    setState(() {
      resetColors();
      seconds = 30;
      _isVisibleA = true;
      _isVisibleB = true;
      _isVisibleC = true;
      _isVisibleD = true;
    });
  }
  //Trừ lượt chơi

  final String? TenLV;
  late int? idLinhVuc;
  final String? email;

  var intValue = Random().nextInt(1);

  _TraLoiCauHoi({this.TenLV, this.idLinhVuc, this.email});
  @override
  Widget build(BuildContext context) {
    _CauHoi = [];
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
    //Lấy id gói câu hỏi
    int idGoi = 0;
    if (intValue == 0) {
      idGoi = 1;
    }
    if (idLinhVuc == 1) {
      idGoi = 2;
    }

    //Giao diện
    String ndcauhoi = "", dapanA = "", dapanB = "", dapanC = "", dapanD = "";

    return FutureBuilder<List<CauHoiObject>>(
      future: CauHoiProvider.get(id, idGoi, SoCau),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CauHoiObject> CauHoi = snapshot.data!;
          ndcauhoi = CauHoi[0].ndCauHoi;
          dapanA = CauHoi[0].dapanA;
          dapanB = CauHoi[0].dapanB;
          dapanC = CauHoi[0].dapanC;
          dapanD = CauHoi[0].dapanD;
          dapanDung = CauHoi[0].dapanDung;
          _CauHoi.add(dapanA);
          _CauHoi.add(dapanB);
          _CauHoi.add(dapanC);
          _CauHoi.add(dapanD);
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
                          onPressed: () {
                            if (dapanA.toString() == "") {
                              final snackBar =
                                  SnackBar(content: Text('Chưa có dữ liệu'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (dapanA.toString() == _CauHoi[dapanDung - 1]) {
                              optionsColor1[0] = Colors.green;
                              SoDiem += 10;
                              SoCauDung++;
                              if (SoCau == 25) {
                                cau25Dung();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                            } else {
                              optionsColor1[0] = Colors.red;
                              if (SoLuotChoi > 0) {
                                SoLuotChoi--;
                              }
                              if (SoLuotChoi == 0) {
                                luotChoi();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                              if (SoCau == 25) {
                                cau25Sai();
                                return;
                              }
                            }
                          },
                          child: Text(
                            dapanA,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side:
                                  BorderSide(color: optionsColor1[0], width: 3),
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
                          onPressed: () {
                            if (dapanB.toString() == "") {
                              final snackBar =
                                  SnackBar(content: Text('Chưa có dữ liệu'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (dapanB.toString() == _CauHoi[dapanDung - 1]) {
                              optionsColor2[0] = Colors.green;
                              SoDiem += 10;
                              SoCauDung++;
                              if (SoCau == 25) {
                                cau25Dung();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                            } else {
                              optionsColor2[0] = Colors.red;
                              if (SoLuotChoi > 0) {
                                SoLuotChoi--;
                              }
                              if (SoLuotChoi == 0) {
                                luotChoi();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                              if (SoCau == 25) {
                                cau25Sai();
                                return;
                              }
                            }
                          },
                          child: Text(
                            dapanB,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side:
                                  BorderSide(color: optionsColor2[0], width: 3),
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
                          onPressed: () {
                            if (dapanC.toString() == "") {
                              final snackBar =
                                  SnackBar(content: Text('Chưa có dữ liệu'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (dapanC.toString() == _CauHoi[dapanDung - 1]) {
                              optionsColor3[0] = Colors.green;
                              SoDiem += 10;
                              SoCauDung++;
                              if (SoCau == 25) {
                                cau25Dung();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                            } else {
                              optionsColor3[0] = Colors.red;
                              if (SoLuotChoi > 0) {
                                SoLuotChoi--;
                              }
                              if (SoLuotChoi == 0) {
                                luotChoi();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                              if (SoCau == 25) {
                                cau25Sai();
                                return;
                              }
                            }
                          },
                          child: Text(
                            dapanC,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side:
                                  BorderSide(color: optionsColor3[0], width: 3),
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
                          onPressed: () {
                            if (dapanD.toString() == "") {
                              final snackBar =
                                  SnackBar(content: Text('Chưa có dữ liệu'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }
                            if (dapanD.toString() == _CauHoi[dapanDung - 1]) {
                              optionsColor4[0] = Colors.green;
                              SoDiem += 10;
                              SoCauDung++;
                              if (SoCau == 25) {
                                cau25Dung();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                            } else {
                              optionsColor4[0] = Colors.red;
                              if (SoLuotChoi > 0) {
                                SoLuotChoi--;
                              }
                              if (SoLuotChoi == 0) {
                                luotChoi();
                                return;
                              }
                              if (SoCau < 25) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    SoCau++;
                                    chuyenCauHoi();
                                  });
                                });
                                return;
                              }
                              if (SoCau == 25) {
                                cau25Sai();
                                return;
                              }
                            }
                          },
                          child: Text(
                            dapanD,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                              side:
                                  BorderSide(color: optionsColor4[0], width: 3),
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
                                timer?.cancel();
                                KhanGia = true;
                                if (dapanDung == 1) {
                                  dapAn =
                                      "A : ${c1}%\nB : ${c2}%\nC : ${c3}%\nD : ${c4}%";
                                } else if (dapanDung == 2) {
                                  dapAn =
                                      "A : ${c3}%\nB : ${c1}%\nC : ${c2}%\nD : ${c4}%";
                                } else if (dapanDung == 3) {
                                  dapAn =
                                      "A : ${c4}%\nB : ${c3}%\nC : ${c1}%\nD : ${c2}%";
                                } else if (dapanDung == 4) {
                                  dapAn =
                                      "A : ${c2}%\nB : ${c4}%\nC : ${c3}%\nD : ${c1}%";
                                }
                                setState(() {});
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Trợ giúp từ khán giả'),
                                        content: Text(
                                          '$dapAn',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                startTimer();
                                              },
                                              child: Text('Ok'))
                                        ],
                                      );
                                    });
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
                                NamMuoi = true;
                                if (dapanDung == 1) {
                                  setState(() {
                                    _isVisibleB = !_isVisibleB;
                                    _isVisibleC = !_isVisibleC;
                                  });
                                } else if (dapanDung == 2) {
                                  setState(() {
                                    _isVisibleA = !_isVisibleA;
                                    _isVisibleC = !_isVisibleC;
                                  });
                                } else if (dapanDung == 3) {
                                  setState(() {
                                    _isVisibleB = !_isVisibleB;
                                    _isVisibleD = !_isVisibleD;
                                  });
                                } else if (dapanDung == 4) {
                                  setState(() {
                                    _isVisibleC = !_isVisibleC;
                                    _isVisibleA = !_isVisibleA;
                                  });
                                }
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
                                timer?.cancel();
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Câu trả lời từ người thân',
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center),
                                        content: Text(
                                          _CauHoi[dapanDung - 1],
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                startTimer();
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
                          if (Skip == false) {
                            if (SoCau == 25) {
                              final snackBar = SnackBar(
                                  content:
                                      Text('Đây đã là câu hỏi cuối cùng !'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              SoCau = SoCau + 1;
                              seconds = maxSeconds;
                              setState(() {
                                _isVisibleA = true;
                                _isVisibleB = true;
                                _isVisibleC = true;
                                _isVisibleD = true;
                              });
                            }
                          } else {
                            Skip = false;
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

  @override
  void setState(VoidCallback fn) async {
    // TODO: implement setState
    if (seconds == 1) {
      if (SoLuotChoi > 1) {
        SoLuotChoi--;
        SoCau++;
        seconds = maxSeconds;
      } else {
        timer?.cancel();
        addHS();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Kết thúc trò chơi'),
                content: Text('Số điểm của bạn: ${SoDiem}'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ManHinhChinh(email: email.toString()),
                          ),
                        );
                      },
                      child: Text('Màn hình chính'))
                ],
              );
            });
      }
    }

    super.setState(fn);
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
