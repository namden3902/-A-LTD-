import 'package:flutter/material.dart';

class Credit extends StatefulWidget {
  @override
  State<Credit> createState() => _Credit();
}

class _Credit extends State<Credit> {
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
                  'Cửa hàng credit',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Center(
                      child: Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Nhập mã thẻ'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: ('Mã thẻ')),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              //Xử lý sau
                                            },
                                            child: Text('Xác nhận'))
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.diamond, color: Colors.white),
                            label: Text(
                              '200',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Center(
                            child: Text('20.000 VND',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    )),
                    Container(
                        child: Center(
                      child: Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Nhập mã thẻ'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: ('Mã thẻ')),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              //Xử lý sau
                                            },
                                            child: Text('Xác nhận'))
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.diamond, color: Colors.white),
                            label: Text(
                              '500',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Center(
                            child: Text('50.000 VND',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Center(
                      child: Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Nhập mã thẻ'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: ('Mã thẻ')),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              //Xử lý sau
                                            },
                                            child: Text('Xác nhận'))
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.diamond, color: Colors.white),
                            label: Text(
                              '2000',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Center(
                            child: Text('200.000 VND',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    )),
                    Container(
                        child: Center(
                      child: Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Nhập mã thẻ'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: ('Mã thẻ')),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              //Xử lý sau
                                            },
                                            child: Text('Xác nhận'))
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.diamond, color: Colors.white),
                            label: Text(
                              '5000',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Center(
                            child: Text('500.000 VND',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
