import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/custom_otn_btn.dart';
import 'package:taskify/common/widgets/custom_text.dart';
import 'package:taskify/common/widgets/height_spacer.dart';
import 'package:taskify/features/todo/controllers/dates/dates_provider.dart';

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
    var scheduleDate = ref.watch(dateStateProvider);
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
              onTap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 6, 01),
                  maxTime: DateTime(2024, 6, 7),
                  theme: const picker.DatePickerTheme(
                    doneStyle: TextStyle(
                      color: AppConsts.kGreen,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (date) {
                    ref.read(dateStateProvider.notifier).setDate(
                          date.toString(),
                        );
                  },
                  currentTime: DateTime.now(),
                  locale: picker.LocaleType.en,
                );
              },
              width: AppConsts.kWidth,
              height: 52.h,
              color: AppConsts.kLight,
              color2: AppConsts.kBlueLight,
              text: scheduleDate == ""
                  ? "Set Date"
                  : scheduleDate.substring(
                      0,
                      10,
                    ),
            ),
            const HeightSpacer(
              hieght: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlnBtn(
                  onTap: () {},
                  width: AppConsts.kWidth * 0.4,
                  height: 52.h,
                  color: AppConsts.kLight,
                  color2: AppConsts.kBlueLight,
                  text: "Start Time",
                ),
                CustomOutlnBtn(
                  onTap: () {},
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
