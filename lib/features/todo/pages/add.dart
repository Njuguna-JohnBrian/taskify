import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/custom_otn_btn.dart';
import 'package:taskify/common/widgets/custom_text.dart';
import 'package:taskify/common/widgets/height_spacer.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: ListView(
          children: [
            const HeightSpacer(
              hieght: 20,
            ),
            CustomTextField(
              hintText: "Add title",
              controller: title,
              hintStyle: appstyle(
                16,
                AppConsts.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(
              hieght: 20,
            ),
            CustomTextField(
              hintText: "Add description",
              controller: desc,
              hintStyle: appstyle(
                16,
                AppConsts.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(
              hieght: 20,
            ),
            CustomOutlnBtn(
              onTap: (){},
              width: AppConsts.kWidth,
              height: 52.h,
              color: AppConsts.kLight,
              color2: AppConsts.kBlueLight,
              text: "Set Date",
            ),

            const HeightSpacer(
              hieght: 20,
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               CustomOutlnBtn(
                 onTap: (){},
                 width: AppConsts.kWidth * 0.4,
                 height: 52.h,
                 color: AppConsts.kLight,
                 color2: AppConsts.kBlueLight,
                 text: "Start Time",
               ),
               CustomOutlnBtn(
                 onTap: (){},
                 width: AppConsts.kWidth * 0.4,
                 height: 52.h,
                 color: AppConsts.kLight,
                 color2: AppConsts.kBlueLight,
                 text: "End Time",
               ),
             ],
           ),
            const HeightSpacer(
              hieght: 20,
            ),
            CustomOutlnBtn(
              width: AppConsts.kWidth * 0.4,
              height: 52.h,
              color: AppConsts.kLight,
              color2: AppConsts.kGreen,
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
