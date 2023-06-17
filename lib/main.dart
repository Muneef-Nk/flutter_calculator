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
        backgroundColor: Colors.deepPurple,
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     color: Colors.red,
            //       alignment: Alignment.bottomRight,
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: Text(history, style: TextStyle(fontSize: 20),),
            //   )),
            // ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(history, style: TextStyle(fontSize: 20),),
                      Text(
                            displayText,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
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
      ),
    );
  }

  Widget btns(String val) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            onPressed: () => btnClicked(val),
            child: Text(
              val,
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
      ),
    );
  }

  String displayText = '';
  String res = '';
  int first = 0;
  int second = 0;
  String opperation='';
  String history='';


  void btnClicked(String btnText) {
    if (btnText == 'c') {
      res = '';
      displayText = '';
      history='';
    }
    else if(btnText == "+" ||
    btnText == "-" ||
    btnText == "x" ||
    btnText == "/"
    ){
      first = int.parse(displayText);
      res ='';
      opperation = btnText;
      print(first);
      print(opperation);
    }else if(btnText== '='){
      second = int.parse(displayText);
      if(opperation == '+'){
        res= (first+second).toString();
        history= first.toString()+opperation+second.toString();
      }  if(opperation == '-'){
        res= (first-second).toString();
        history= first.toString()+opperation+second.toString();
      }  if(opperation == '/'){
        res= (first/second).toString();
        history= first.toString()+opperation+second.toString();
      }  if(opperation == 'x'){
        res= (first*second).toString();
        history= first.toString()+opperation+second.toString();
      }
    }
    else {
      res =  displayText+btnText;
    }
    setState(() {
      displayText = res;
    });
  }
}
