import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/input_field_model.dart';

class MinuteButtonWidget extends StatelessWidget {
  const MinuteButtonWidget({super.key, required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          controller.clear();
          Provider.of<InputFieldModel>(context, listen: false)
              .updateChoosenMin(int.parse(label));
          Provider.of<InputFieldModel>(context, listen: false)
              .updateInputFieldText(label);
          controller.text = label;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
