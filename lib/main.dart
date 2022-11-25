import 'package:flutter/services.dart';

import 'dangnhap.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(DaiNam());
}

class DaiNam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Một câu nữa thôi', home: DangNhap());
  }
}
