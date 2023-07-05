import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({super.key});
  final Color borderColor = const Color(0XFF2F9EEF);

  @override
  State<InputFieldWidget> createState() => InputFieldWidgetState();
}

class InputFieldWidgetState extends State<InputFieldWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
          color: widget.borderColor,
        ),
        suffixIcon: controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                onPressed: () {
                  controller.clear();
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
