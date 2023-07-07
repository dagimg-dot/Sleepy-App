import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_app/provider/input_field_model.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({super.key, required this.controller});
  final Color borderColor = const Color(0XFF2F9EEF);
  final TextEditingController controller;

  @override
  State<InputFieldWidget> createState() => InputFieldWidgetState();
}

class InputFieldWidgetState extends State<InputFieldWidget> {
  bool isInteger(String value) {
    final intResult = int.tryParse(value);
    return intResult != null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      onSubmitted: (text) {
        if (text.isEmpty || !isInteger(text)) {
          return;
        }
        Provider.of<InputFieldModel>(context, listen: false)
            .updateChoosenMin(int.parse(text));
      },
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.timer_rounded,
          color: widget.borderColor,
        ),
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                onPressed: () {
                  widget.controller.clear();
                },
                icon: Icon(
                  Icons.close,
                  color: widget.borderColor,
                ),
              ),
        labelText: "Set Timer",
        labelStyle: TextStyle(
          color: widget.borderColor,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
