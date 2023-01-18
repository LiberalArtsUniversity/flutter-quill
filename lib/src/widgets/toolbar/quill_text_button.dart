import 'package:flutter/material.dart';

class QuillTextButton extends StatelessWidget {
  const QuillTextButton({
    required this.onPressed,
    this.title,
    this.size = 40,
    this.fillColor,
    this.borderColor = Colors.grey,
    this.borderWidth = 0.5,
    this.hoverElevation = 1,
    this.highlightElevation = 1,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? title;
  final double size;
  final Color? fillColor;
  final Color borderColor;
  final double borderWidth;
  final double hoverElevation;
  final double highlightElevation;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: size),
        child: ElevatedButton(
            child: title,
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: fillColor,
              side: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
              padding: const EdgeInsets.all(4),
              shadowColor: Colors.transparent,
            )));
  }
}
