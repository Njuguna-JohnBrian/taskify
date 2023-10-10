import 'package:flutter/material.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/height_spacer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(
                hieght: AppConsts.kHeight * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: AppConsts.kWidth * 0.5,
                ),
              ),
              const HeightSpacer(
                hieght: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
