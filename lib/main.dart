// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/toggles_model.dart';
import 'package:sleepy_app/input_field_model.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TogglesModel()),
        ChangeNotifierProvider(create: (context) => InputFieldModel()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleepy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0XFF2F9EEF);
  final numberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    numberController.addListener(() => setState(() {}));
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
            // show a pop up that says i am tapped when tapped
            tooltip: 'Menu',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
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
                  return AlertDialog(
                    title: Text('Dark Mode'),
                    content: Text('I am tapped'),
                  );
                },
              );
            },
            icon: Icon(
              Icons.dark_mode_outlined,
              color: Color(0XFF2F9EEF),
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Row 1: Text
            Container(
              padding: const EdgeInsets.all(10),
              // color: Colors.amber,
              margin: const EdgeInsets.only(top: 3),
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
                      iconBuilder(mainColor, 'Wi-Fi', context),
                      iconBuilder(mainColor, 'Bluetooth', context),
                      iconBuilder(mainColor, 'Screen', context),
                      iconBuilder(mainColor, 'Sound Mode', context),
                    ],
                  ),
                );
              },
            ),
            // Row 3: Counter Box
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Timer Started",
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
                  child: Text(
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
                    child: Center(
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
              child: textFieldBuilder(
                  mainColor, 'Set Timer', numberController, context),
            ),
            // Row 6: Common minutes
            Consumer<InputFieldModel>(
              builder: (context, inputFieldModel, child) {
                return Container(
                  // color: Colors.amber,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 25,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      minuteButtonBuilder(mainColor, numberController, context)
                    ],
                  ),
                );
              },
            ),
            // Row 7: Start Button
            Container(
                margin: const EdgeInsets.only(top: 13),
                child: InkWell(
                  splashColor: Colors.amberAccent,
                  onTap: () {
                    Provider.of<InputFieldModel>(context, listen: false)
                        .updateInputFieldText(numberController.text);
                    print(Provider.of<InputFieldModel>(context, listen: false)
                        .getInputFieldText);
                  },
                  child: Container(
                    width: 170,
                    height: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Column iconBuilder(Color color, String label, BuildContext context) {
  return Column(children: [
    GestureDetector(
      onTap: () {
        switch (label) {
          case 'Wi-Fi':
            Provider.of<TogglesModel>(context, listen: false)
                .toggleWifiButton();
            break;
          case 'Bluetooth':
            Provider.of<TogglesModel>(context, listen: false)
                .toggleBluetoothButton();
            break;
          case 'Screen':
            Provider.of<TogglesModel>(context, listen: false)
                .toggleScreenOffButton();
            break;
          case 'Sound Mode':
            Provider.of<TogglesModel>(context, listen: false)
                .toggleDoNotDisturbButton();
            break;
        }
      },
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: iconChoose(label, context),
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

Icon iconChoose(String label, BuildContext context) {
  if (label == 'Wi-Fi') {
    if (Provider.of<TogglesModel>(context, listen: false).getWifiButtonState) {
      return Icon(
        Icons.wifi_rounded,
        size: 58,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.wifi_off_rounded,
        size: 58,
        color: Colors.white,
      );
    }
  }
  if (label == 'Bluetooth') {
    if (Provider.of<TogglesModel>(context, listen: false)
        .getBluetoothButtonState) {
      return Icon(
        Icons.bluetooth_rounded,
        size: 58,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.bluetooth_disabled_rounded,
        size: 58,
        color: Colors.white,
      );
    }
  }
  if (label == 'Screen') {
    if (Provider.of<TogglesModel>(context, listen: false)
        .getScreenButtonState) {
      return Icon(
        Icons.phone_android_rounded,
        size: 58,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.mobile_off_rounded,
        size: 58,
        color: Colors.white,
      );
    }
  }
  if (label == 'Sound Mode') {
    if (Provider.of<TogglesModel>(context, listen: false)
        .getDoNotDisturbButtonState) {
      return Icon(
        Icons.volume_up_rounded,
        size: 58,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.volume_off_rounded,
        size: 58,
        color: Colors.white,
      );
    }
  }
  return Icon(Icons.not_accessible);
}

Row minuteButtonBuilder(
    Color color, TextEditingController controller, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 70,
        height: 60,
        margin: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: () {
            controller.clear();
            Provider.of<InputFieldModel>(context, listen: false)
                .updateChoosenMin(5);
            Provider.of<InputFieldModel>(context, listen: false)
                .updateInputFieldText("5");
            controller.text = "5";
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            '5',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      Container(
        width: 70,
        height: 60,
        margin: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: () {
            controller.clear();
            Provider.of<InputFieldModel>(context, listen: false)
                .updateChoosenMin(10);
            Provider.of<InputFieldModel>(context, listen: false)
                .updateInputFieldText("10");
            controller.text = "10";
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            '10',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      Container(
        width: 70,
        height: 60,
        margin: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: () {
            controller.clear();
            Provider.of<InputFieldModel>(context, listen: false)
                .updateChoosenMin(15);
            Provider.of<InputFieldModel>(context, listen: false)
                .updateInputFieldText("15");
            controller.text = "15";
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            '15',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      Container(
        width: 70,
        height: 60,
        margin: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          onPressed: () {
            controller.clear();
            Provider.of<InputFieldModel>(context, listen: false)
                .updateChoosenMin(30);
            Provider.of<InputFieldModel>(context, listen: false)
                .updateInputFieldText("30");
            controller.text = "30";
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            '30',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    ],
  );
}

TextField textFieldBuilder(Color color, String label,
    TextEditingController controller, BuildContext context) {
  return TextField(
    enabled: true,
    // onChanged: (text) {
    //   Provider.of(context, listen: false).updateInputFieldText(text);
    // },
    // onSubmitted: (text) {
    //   String input = Provider.of(context, listen: false).getInputFieldText;
    //   print(input);
    // },
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.timer_rounded,
        color: color,
      ),
      suffixIcon: controller.text.isEmpty
          ? Container(width: 0)
          : IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: Icon(
                Icons.close,
                color: color,
              ),
            ),
      labelText: label,
      labelStyle: TextStyle(
        color: color,
        fontSize: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

void displayTappedMin() {
  // display the tapped minutes from the minute builder buttons in the text field
}
