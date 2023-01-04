// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleepy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0XFF2F9EEF);
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sleepy',
          style: TextStyle(
            color: Color(0XFF2F9EEF),
            fontSize: 24,
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: mainColor,
          size: 27,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Row 1: Text
          Container(
            padding: const EdgeInsets.all(10),
            // color: Colors.amber,
            margin: const EdgeInsets.only(top: 10),
            child: Align(
              // alignment: Alignment.center,
              child: Text(
                'Choose what to do on sleep',
                style: TextStyle(
                  color: Color(0XFF2F9EEF),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          // Row 2: The Icons
          Container(
            // color: Colors.amber,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTapped ? isTapped = false : isTapped = true;
                      });
                      print(isTapped);
                      print("Tapped the wifi container");
                    },
                    child: Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: isTapped
                            ? Icon(
                                Icons.wifi_rounded,
                                size: 62,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.wifi_off_rounded,
                                size: 62,
                                color: Colors.white,
                              )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Wi-Fi',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.wifi,
                    size: 86,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text('Turn off Wi-Fi'),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.wifi,
                    size: 86,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text('Turn off Wi-Fi'),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


