// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/provider/toggles_model.dart';
import 'package:sleepy_app/widget/icon_button_widget.dart';
import 'package:sleepy_app/widget/input_field_widget.dart';
import 'package:sleepy_app/widget/minute_button_widget.dart';

import '../provider/input_field_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0XFF2F9EEF);


  // void startCountdown() {
  //   setState(() {
  //     if (numberController.text.isNotEmpty) {
  //       // time = DateTime(0, 0, 0, 0, int.parse(numberController.text), 0);
  //       // change the time to minutes and seconds
  //       Timer.periodic(const Duration(seconds: 1), (timer) {
  //         setState(() {
  //           // if (time.second > 0) {
  //             // time = time.subtract(Duration(seconds: 1));
  //             print(time);
  //           // } else {
  //           //   timer.cancel();
  //           // }
  //         });
  //       });
  //     }
  //   });
  // }

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
        leading: IconButton(
            // show a pop up that says i am tapped when tapped
            tooltip: 'Menu',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text('Menu'),
                    content: Text('I am tapped'),
                  );
                },
              );
            },
            icon: Icon(
              Icons.menu,
              color: mainColor,
              size: 25,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Dark Mode',
            onPressed: () {
              // show a pop up that says i am tapped when tapped
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text('Dark Mode'),
                    content: Text('I am tapped'),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: Color(0XFF2F9EEF),
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Row 1: Text
            Container(
              padding: const EdgeInsets.all(10),
              // color: Colors.amber,
              margin: const EdgeInsets.only(top: 3),
              child: const Align(
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
            Consumer<TogglesModel>(
              builder: (context, togglesModel, child) {
                return Container(
                  // color: Colors.amber,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      // Wi-Fi
                      IconButtonWidget(
                          label: 'Wi-Fi',
                          boolState:
                              Provider.of<TogglesModel>(context, listen: false)
                                  .getWifiButtonState,
                          iconON: Icons.wifi_rounded,
                          iconOFF: Icons.wifi_off_rounded,
                          onPressed: () => {
                                Provider.of<TogglesModel>(context,
                                        listen: false)
                                    .toggleWifiButton(),
                              }),
                      // Bluetooth
                      IconButtonWidget(
                          label: 'Bluetooth',
                          boolState:
                              Provider.of<TogglesModel>(context, listen: false)
                                  .getBluetoothButtonState,
                          iconON: Icons.bluetooth_rounded,
                          iconOFF: Icons.bluetooth_disabled_rounded,
                          onPressed: () => {
                                Provider.of<TogglesModel>(context,
                                        listen: false)
                                    .toggleBluetoothButton(),
                              }),
                      // Screen
                      IconButtonWidget(
                          label: 'Screen',
                          boolState:
                              Provider.of<TogglesModel>(context, listen: false)
                                  .getScreenButtonState,
                          iconON: Icons.phone_android_rounded,
                          iconOFF: Icons.mobile_off_rounded,
                          onPressed: () => {
                                Provider.of<TogglesModel>(context,
                                        listen: false)
                                    .toggleScreenOffButton(),
                              }),
                      // SoundMode
                      IconButtonWidget(
                          label: 'Sound Mode',
                          boolState:
                              Provider.of<TogglesModel>(context, listen: false)
                                  .getDoNotDisturbButtonState,
                          iconON: Icons.volume_up_rounded,
                          iconOFF: Icons.volume_off_rounded,
                          onPressed: () => {
                                Provider.of<TogglesModel>(context,
                                        listen: false)
                                    .toggleDoNotDisturbButton(),
                              }),
                    ],
                  ),
                );
              },
            ),
            // Row 3: Counter Box
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Timer Started",
                    style: TextStyle(
                      color: Color(0XFF2F9EEF),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    // '${time.minute}:${time.second.toString().padLeft(2, '0')}',
                    '00:00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            // Row 4: Add Button
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )),
            // Row 5: Input Box
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8),
              child: const InputFieldWidget(),
            ),
            // Row 6: Common minutes
            Consumer<InputFieldModel>(
              builder: (context, inputFieldModel, child) {
                return Container(
                  // color: Colors.amber,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceAround,
                    children: const [
                      MinuteButtonWidget(label: '5'),
                      MinuteButtonWidget(label: '10'),
                      MinuteButtonWidget(label: '15'),
                      MinuteButtonWidget(label: '30'),
                    ],
                  ),
                );
              },
            ),
            // Row 7: Start Button
            // Container(
            //     margin: const EdgeInsets.only(top: 13),
            //     child: InkWell(
            //       splashColor: Colors.amberAccent,
            //       onTap: () {
            //         Provider.of<InputFieldModel>(context, listen: false)
            //             .updateInputFieldText(numberController.text);
            //         print(Provider.of<InputFieldModel>(context, listen: false)
            //             .getInputFieldText);
            //         startCountdown();
            //       },
            //       child: Container(
            //         width: 170,
            //         height: 45,
            //         decoration: BoxDecoration(
            //           color: mainColor,
            //           borderRadius: BorderRadius.circular(30),
            //         ),
            //         child: const Center(
            //           child: Text(
            //             'Start',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 18,
            //             ),
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}
