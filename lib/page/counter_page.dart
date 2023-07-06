import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/provider/input_field_model.dart';
import 'package:sleepy_app/provider/toggles_model.dart';
import 'package:sleepy_app/widget/button_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = CountDownController();
  final Color mainColor = const Color(0XFF2F9EEF);

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await AndroidFlutterWifi.init();
  }

  void toggleWifiButton() {
    AndroidFlutterWifi.isWifiEnabled()
        .then((value) => {if (value) AndroidFlutterWifi.disableWifi()});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Sleepy',
            style: TextStyle(
              color: Color(0XFF2F9EEF),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              NeonCircularTimer(
                width: 200,
                duration: Provider.of<InputFieldModel>(context, listen: false)
                        .getChoosenMin *
                    60,
                controller: controller,
                isReverse: true,
                backgroudColor: const Color.fromARGB(255, 140, 198, 240),
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                isReverseAnimation: true,
                isTimerTextShown: true,
                neumorphicEffect: true,
                strokeWidth: 15,
                onComplete: () => {
                  if (!Provider.of<TogglesModel>(context, listen: false).getWifiButtonState) toggleWifiButton(),
                  Navigator.pop(context),
                },
                innerFillGradient: LinearGradient(colors: [
                  Colors.greenAccent.shade200,
                  Colors.blueAccent.shade400
                ]),
                neonGradient: LinearGradient(colors: [
                  Colors.greenAccent.shade200,
                  Colors.blueAccent.shade400
                ]),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ButtonWidget(
                  mainColor: mainColor,
                  width: 170,
                  label: "Cancel",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
