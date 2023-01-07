// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/state.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => TogglesModel(),
      child: const MyApp(),
    ));

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
  // bool isTapped = false;
  // var tapState = List<int>.filled(4, 0);

  @override
  Widget build(BuildContext context) {
    // final isWifiButtonOffMode = Provider.of<TogglesModel>(context).getState;
    // final toggleWifiButton = Provider.of<TogglesModel>(context).toggle();
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
        leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu,
              color: mainColor,
              size: 25,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: const [
          IconButton(
            tooltip: 'Dark Mode',
            onPressed: null,
            icon: Icon(
              Icons.dark_mode_outlined,
              color: Color(0XFF2F9EEF),
              size: 25,
            ),
          ),
        ],
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
            child: Center(
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                alignment: WrapAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  iconBuilder(mainColor, 'Wi-Fi'),
                  iconBuilder(mainColor, 'Bluetooth'),
                  iconBuilder(mainColor, 'Screen'),
                  iconBuilder(mainColor, 'Sound Mode'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Column iconBuilder(Color color, String label) {
  return Column(children: [
    GestureDetector(
      onTap: () {},
      child: Container(
        width: 86,
        height: 86,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: iconChoose(false, label),
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 14,
        ),
      ),
    ),
  ]);
}

Icon iconChoose(bool isOn, String label) {
  // late labels = List<String>;
  return isOn
      ? Icon(
          Icons.wifi_rounded,
          size: 62,
          color: Colors.white,
        )
      : Icon(
          Icons.wifi_off_rounded,
          size: 62,
          color: Colors.white,
        );
}
