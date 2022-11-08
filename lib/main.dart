import 'package:flutter/material.dart';

void main(List<String> args) {}

class DaiNam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Một câu nữa thôi',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wellcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
