import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String text;
  final void Function() onClickFn;
  final double? minHeight;
  final double? minWidth;
  const SignButton(
      {required this.text,
      required this.onClickFn,
      this.minHeight,
      this.minWidth,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClickFn(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: Size(minWidth ?? 200, minHeight ?? 40),
      ),
      child: Text(text),
    );
  }
}
