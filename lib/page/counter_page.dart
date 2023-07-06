import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/provider/input_field_model.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: NeonCircularTimer(
            width: 200,
            duration: Provider.of<InputFieldModel>(context, listen: false)
                .getChoosenMin,
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
            onComplete: () => print('Countdown Ended'),
            innerFillGradient: LinearGradient(colors: [
              Colors.greenAccent.shade200,
              Colors.blueAccent.shade400
            ]),
            neonGradient: LinearGradient(colors: [
              Colors.greenAccent.shade200,
              Colors.blueAccent.shade400
            ]),
          ),
      ),
    );
  }
}
