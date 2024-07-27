
import 'package:flutter/material.dart';
import 'package:machinetest_newsapp/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
    required this.text,
    this.onPressed,
  });

  final Size size;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.blue,
          foregroundColor: Constants.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}