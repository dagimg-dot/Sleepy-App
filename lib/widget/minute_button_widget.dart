import 'package:flutter/material.dart';

class MinuteButtonWidget extends StatelessWidget {
  const MinuteButtonWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          // controller.clear();
          // Provider.of<InputFieldModel>(context, listen: false)
          //     .updateChoosenMin(5);
          // Provider.of<InputFieldModel>(context, listen: false)
          //     .updateInputFieldText("5");
          // controller.text = "5";
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
