import 'dart:async';
import 'dart:math';
import 'package:doan_laptrinhdidong/credit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int SoCau = 1, SoDiem = 500, SoCredit = 0;
bool NguoiThan = false;
bool NamMuoi = false;
bool KhanGia = false;
bool _isVisibleA = true;
bool _isVisibleB = true;
bool _isVisibleC = true;
bool _isVisibleD = true;

class TraLoiCauHoi extends StatefulWidget {
  final String? TenLinhVuc;
  TraLoiCauHoi({this.TenLinhVuc});
  @override
  State<TraLoiCauHoi> createState() => _TraLoiCauHoi(TenLV: TenLinhVuc);
}

class _TraLoiCauHoi extends State<TraLoiCauHoi> {
  String DA = "A";
  static const maxSeconds = 1;
  int seconds = maxSeconds;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds--);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  final String? TenLV;
  _TraLoiCauHoi({this.TenLV});
  @override
  Widget build(BuildContext context) {
    if (seconds == 0) {
      timer?.cancel();
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
                                'Credit:' + SoCredit.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Credit()));
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
                'Đảo Phú Quý thuộc tỉnh nào ?',
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
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Visibility(
                visible: _isVisibleB,
                child: OutlinedButton(
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
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Visibility(
                visible: _isVisibleC,
                child: OutlinedButton(
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
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Visibility(
                visible: _isVisibleD,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'D. Ninh Thuận',
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
                        KhanGia = true;
                        if (DA == "A") {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Danh sách đáp án bình chọn'),
                                  content: Container(
                                      child: SizedBox(
                                    height: 90,
                                    child: Column(
                                      children: [
                                        Text('A: 30%'),
                                        Text('B: 26%'),
                                        Text('C: 24%'),
                                        Text('A: 20%'),
                                      ],
                                    ),
                                  )),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Xin cảm ơn'))
                                  ],
                                );
                              });
                        } else if (DA == "B") {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Danh sách đáp án bình chọn'),
                                  content: Container(
                                      child: SizedBox(
                                    height: 90,
                                    child: Column(
                                      children: [
                                        Text('A: 15%'),
                                        Text('B: 45%'),
                                        Text('C: 18%'),
                                        Text('A: 22%'),
                                      ],
                                    ),
                                  )),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Xin cảm ơn'))
                                  ],
                                );
                              });
                        } else if (DA == "A") {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Danh sách đáp án bình chọn'),
                                  content: Container(
                                      child: SizedBox(
                                    height: 90,
                                    child: Column(
                                      children: [
                                        Text('A: 10%'),
                                        Text('B: 16%'),
                                        Text('C: 60%'),
                                        Text('A: 14%'),
                                      ],
                                    ),
                                  )),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Xin cảm ơn'))
                                  ],
                                );
                              });
                        } else if (DA == "A") {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Danh sách đáp án bình chọn'),
                                  content: Container(
                                      child: SizedBox(
                                    height: 90,
                                    child: Column(
                                      children: [
                                        Text('A: 15%'),
                                        Text('B: 25%'),
                                        Text('C: 20%'),
                                        Text('A: 40%'),
                                      ],
                                    ),
                                  )),
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
                        if (DA == "A") {
                          setState(() {
                            _isVisibleB = !_isVisibleB;
                            _isVisibleC = !_isVisibleC;
                          });
                        } else if (DA == "B") {
                          setState(() {
                            _isVisibleA = !_isVisibleA;
                            _isVisibleC = !_isVisibleC;
                          });
                        } else if (DA == "C") {
                          setState(() {
                            _isVisibleB = !_isVisibleB;
                            _isVisibleD = !_isVisibleD;
                          });
                        } else if (DA == "D") {
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
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Câu trả lời từ người thân',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center),
                                content: Text(
                                  'B',
                                  style: TextStyle(
                                      fontSize: 100, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Xin cảm ơn',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                                actionsAlignment: MainAxisAlignment.center,
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
