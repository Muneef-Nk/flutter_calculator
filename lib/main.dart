import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          ),
          Row(
            children: [
              btns('9'),
              btns('8'),
              btns('7'),
              btns('+'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              btns('6'),
              btns('5'),
              btns('4'),
              btns('-'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              btns('3'),
              btns('2'),
              btns('1'),
              btns('x'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              btns('c'),
              btns('0'),
              btns('='),
              btns('/'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget btns(String val) {
    return Expanded(
      child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            shape: MaterialStatePropertyAll(
              CircleBorder(
                side: BorderSide(
                  color: Colors.red,
                  width: 10,
                ),
              ),
            ),
          ),
          onPressed: () => btnClicked(val),
          child: Text(
            val,
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
    );
  }

}
