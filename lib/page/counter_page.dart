import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/provider/input_field_model.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
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
        child: Text(
          Provider.of<InputFieldModel>(context, listen: false)
              .getChoosenMin
              .toString(),
        ),
      ),
    );
  }
}
