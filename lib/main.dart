import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dangnhap.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DaiNam());
}

class DaiNam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Một câu nữa thôi', home: DangNhap());
  }
}
