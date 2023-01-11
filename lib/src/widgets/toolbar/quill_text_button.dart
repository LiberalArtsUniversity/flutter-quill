import 'package:flutter/material.dart';

class QuillTextButton extends StatelessWidget {
  const QuillTextButton({
    required this.onPressed,
    this.title,
    this.size = 40,
    this.fillColor,
    this.hoverElevation = 1,
    this.highlightElevation = 1,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? title;
  final double size;
  final Color? fillColor;
  final double hoverElevation;
  final double highlightElevation;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: size),
      child: RawMaterialButton(
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        fillColor: fillColor,
        elevation: 0,
        hoverElevation: hoverElevation,
        highlightElevation: hoverElevation,
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
