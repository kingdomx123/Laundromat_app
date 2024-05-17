import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laundromat_Company',
      home: MyHome_app(),
    );
  }
}

class MyHome_app extends StatefulWidget {
  const MyHome_app({super.key});

  @override
  State<MyHome_app> createState() => _MyHome_appState();
}

class _MyHome_appState extends State<MyHome_app> {
  bool isRunning1 = false;
  bool isRunning2 = false;
  String statusMessage1 = 'เครื่องพร้อมใช้งาน';
  String statusMessage2 = 'เครื่องพร้อมใช้งาน';

  void startMachine1() {
    setState(() {
      isRunning1 = true;
      statusMessage1 = 'กำลังซักผ้า';
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        isRunning1 = false;
        statusMessage1 = 'เครื่องพร้อมใช้งาน';
        Fluttertoast.showToast(
            msg: 'เครื่องที่ 1 พร้อมใช้งานแล้ว',
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 2,
            fontSize: 18);
      });
    });
  }

  void startMachine2() {
    setState(() {
      isRunning2 = true;
      statusMessage2 = 'กำลังซักผ้า';
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        isRunning2 = false;
        statusMessage2 = 'เครื่องพร้อมใช้งาน';
        Fluttertoast.showToast(
            msg: 'เครื่องที่ 2 พร้อมใช้งานแล้ว',
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 2,
            fontSize: 18);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundromat'),
        backgroundColor: Color.fromARGB(255, 247, 130, 130),
      ),
      backgroundColor: Color.fromARGB(255, 249, 188, 188),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isRunning1)
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "กรุณาใส่เหรียญสำหรับการซักผ้า",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.black87, width: 2),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text(
                                  "ยกเลิก",
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.black87, width: 2),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "ใส่เหรียญ",
                                  ),
                                  onPressed: () {
                                    startMachine1();
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        );
                      else {
                        Fluttertoast.showToast(
                            msg:
                                'มีการใช้งานเครื่องที่ 1 กรุณาเลือกเครื่องถัดไป',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 2,
                            fontSize: 18);
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Container(
                                    height: 215,
                                    width: 150,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 140,
                                          width: 150,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://i.pinimg.com/564x/90/91/4a/90914a0b670aeb90a5226ca107433936.jpg'), // Replace this with your image asset
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'เครื่องที่ 1',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const Text(
                                          'สถานะ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.red),
                                        ),
                                        Text(
                                          statusMessage1,
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!isRunning2)
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "กรุณาใส่เหรียญสำหรับการซักผ้า",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.black87, width: 2),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                child: Text(
                                  "ยกเลิก",
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.black87, width: 2),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "ใส่เหรียญ",
                                  ),
                                  onPressed: () {
                                    startMachine2();
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        );
                      else
                        Fluttertoast.showToast(
                            msg:
                                'มีการใช้งานเครื่องที่ 2 กรุณาเลือกเครื่องถัดไป',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 2,
                            fontSize: 18);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Container(
                                    height: 215,
                                    width: 150,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 140,
                                          width: 150,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://i.pinimg.com/564x/b6/e2/e5/b6e2e575e4917fe8129f2aab49c36bef.jpg'), // Replace this with your image asset
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'เครื่องที่ 2',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const Text(
                                          'สถานะ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.red),
                                        ),
                                        Text(
                                          statusMessage2,
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
