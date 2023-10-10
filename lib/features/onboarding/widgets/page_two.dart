import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/custom_otn_btn.dart';
import '../../../common/widgets/height_spacer.dart';
import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
            hieght: 50,
          ),
          CustomOutlnBtn(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            width: AppConsts.kWidth * 0.9,
            height: AppConsts.kHeight * 0.06,
            text: 'Login with a phone number',
            color: AppConsts.kLight,
          ),
        ],
      ),
    );
  }
}
