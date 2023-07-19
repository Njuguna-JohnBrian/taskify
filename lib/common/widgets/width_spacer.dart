import 'package:flutter/widgets.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.wydth});

  final double wydth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wydth,
    );
  }
}
