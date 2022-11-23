import 'package:flutter/material.dart';

class muacredit extends StatelessWidget {
  const muacredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mua credit'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/conmeongungocdangiu.jpeg'),
          Text(
            "Mua credit",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Padding(padding: EdgeInsets.all(30)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.diamond),
                      label: Text(
                        '500',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
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
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(50),
                ),
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.diamond),
                      label: Text(
                        '1000',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Center(
                      child: Text('100.000 VND',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.diamond),
                      label: Text(
                        '1500',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Center(
                      child: Text('150.000 VND',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(45),
                ),
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.diamond),
                      label: Text(
                        '2000',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
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
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
