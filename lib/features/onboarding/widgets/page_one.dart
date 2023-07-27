import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/height_spacer.dart';
import 'package:taskify/common/widgets/reusable_text.dart';

import '../../../common/widgets/appstyle.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.kHeight,
      width: AppConsts.kWidth,
      color: AppConsts.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Image.asset(
              "assets/images/todo.png",
            ),
          ),
          const HeightSpacer(
            hieght: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "Taskify",
                style: appstyle(
                  30,
                  AppConsts.kLight,
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(
                hieght: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Text(
                  "Welcome!! Do you want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appstyle(
                    16,
                    AppConsts.kLight,
                    FontWeight.normal,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
