// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/page/counter_page.dart';
import 'package:sleepy_app/provider/toggles_model.dart';
import 'package:sleepy_app/services/android_controls.dart';
import 'package:sleepy_app/widget/icon_button_widget.dart';
import 'package:sleepy_app/widget/input_field_widget.dart';
import 'package:sleepy_app/widget/minute_button_widget.dart';

import '../provider/input_field_model.dart';
import '../widget/button_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0XFF2F9EEF);
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  void navigateToCounterPage() {
    if (controller.text.isEmpty) {
      SnackBar snackBar = const SnackBar(
        content: Text(
          "Please enter the time in minutes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 216, 81, 57),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (isIconButtonSelected()) {
      SnackBar snackBar = const SnackBar(
        content: Text(
          "Please select at least one option to turn on/off before you sleep",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        duration: Duration(seconds: 4),
        backgroundColor: Color.fromARGB(255, 216, 81, 57),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Provider.of<InputFieldModel>(context, listen: false)
          .updateInputFieldText(controller.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CounterPage(),
        ),
      );
    }
  }

  bool isIconButtonSelected() {
    return Provider.of<TogglesModel>(context, listen: false)
            .getWifiButtonState &&
        Provider.of<TogglesModel>(context, listen: false)
            .getBluetoothButtonState &&
        Provider.of<TogglesModel>(context, listen: false)
            .getScreenButtonState &&
        !Provider.of<TogglesModel>(context, listen: false)
            .getDoNotDisturbButtonState;
  }

  void handlePressLS() async {
    ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);
    bool? isGranted = await checkPermissionLS(context);
    if (isGranted == false) {
      SnackBar snackBar = const SnackBar(
        content: Text(
          "Permission denied, please grant permission to use this feature",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 216, 81, 57),
        behavior: SnackBarBehavior.floating,
      );
      scaffoldMessengerState.showSnackBar(snackBar);
    }
  }

  Future<bool?> checkPermissionLS(context) async {
    bool? isGranted = await AndroidControls.requestPermessionLS(context);
    if (isGranted == true) {
      Provider.of<TogglesModel>(context, listen: false).toggleScreenOffButton();
      return true;
    } else {
      return false;
    }
  }

  void handlePressDND() async {
    ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);
    bool? isGranted = await checkPermissionDND(context);
    if (isGranted == false) {
      SnackBar snackBar = const SnackBar(
        content: Text(
          "Permission denied, please grant permission to use this feature",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 216, 81, 57),
        behavior: SnackBarBehavior.floating,
      );
      scaffoldMessengerState.showSnackBar(snackBar);
    }
  }

  Future<bool?> checkPermissionDND(context) async {
    bool? isGranted = await AndroidControls.requestPermessionDND(context);
    if (isGranted == true) {
      Provider.of<TogglesModel>(context, listen: false)
          .toggleDoNotDisturbButton();
      return true;
    } else {
      return false;
    }
  }

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
            // TODO: Implement menu
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
              // TODO: Implement dark mode
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
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
                  ),
                ),
              ),
              // Row 2: The Icons
              Consumer<TogglesModel>(
                builder: (context, togglesModel, child) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        // Wi-Fi
                        IconButtonWidget(
                            label: 'Turn off Wi-Fi',
                            boolState: Provider.of<TogglesModel>(context,
                                    listen: false)
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
                            label: 'Turn off Bluetooth',
                            boolState: Provider.of<TogglesModel>(context,
                                    listen: false)
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
                          label: 'Lock Screen',
                          boolState:
                              Provider.of<TogglesModel>(context, listen: false)
                                  .getScreenButtonState,
                          iconON: Icons.phone_android_rounded,
                          iconOFF: Icons.mobile_off_rounded,
                          onPressed: () => handlePressLS(),
                        ),
                        // SoundMode
                        IconButtonWidget(
                            label: 'Turn on Do not disturb',
                            boolState: Provider.of<TogglesModel>(context,
                                    listen: false)
                                .getDoNotDisturbButtonState,
                            iconON: Icons.do_disturb_on_rounded,
                            iconOFF: Icons.do_disturb_off_rounded,
                            onPressed: () => handlePressDND()),
                      ],
                    ),
                  );
                },
              ),
              // Row 5: Input Box
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(8),
                child: InputFieldWidget(controller: controller),
              ),
              // Row 6: Common minutes
              Consumer<InputFieldModel>(
                builder: (context, inputFieldModel, child) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        MinuteButtonWidget(label: '5', controller: controller),
                        MinuteButtonWidget(label: '10', controller: controller),
                        MinuteButtonWidget(label: '15', controller: controller),
                        MinuteButtonWidget(label: '30', controller: controller),
                      ],
                    ),
                  );
                },
              ),
              // Row 7: Start Button
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: InkWell(
                  onTap: () {
                    navigateToCounterPage();
                  },
                  child: ButtonWidget(
                      mainColor: mainColor, width: 170, label: 'Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
