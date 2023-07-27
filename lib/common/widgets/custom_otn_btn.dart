import 'package:flutter/material.dart';

class CustomOutlnBtn extends StatelessWidget {
  const CustomOutlnBtn({
    super.key,
    this.onTap,
    this.color2,
    required this.width,
    required this.height,
  });

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          borderRadius:  BorderRadius.circular(20),
          border: Border.all(width: 1, color: color2)
        ),
      ),
    );
  }
}
