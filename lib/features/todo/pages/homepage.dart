import 'package:flutter/material.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/reusable_text.dart';

import '../../../common/widgets/height_spacer.dart';
import '../../../common/widgets/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
              text: "Taskify",
              style: appstyle(
                26,
                AppConsts.kGreen,
                FontWeight.bold,
              ),
            ),
            const WidthSpacer(
              wydth: 10,
            ),
            ReusableText(
              text: "Taskify",
              style: appstyle(
                26,
                AppConsts.kGreen,
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
