import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget(
      {super.key,
      required this.label,
      required this.boolState,
      required this.iconON,
      required this.iconOFF,
      required this.onPressed});

  final Color mainColor = const Color(0XFF2F9EEF);
  final String label;
  final bool boolState;
  final IconData iconON;
  final IconData iconOFF;
  final void Function() onPressed;

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.onPressed();
          },
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: widget.mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              widget.boolState ? widget.iconON : widget.iconOFF,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.label,
          style: TextStyle(
            color: widget.mainColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
