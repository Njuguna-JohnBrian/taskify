import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:taskify/common/models/task_model.dart';

import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/custom_otn_btn.dart';
import 'package:taskify/common/widgets/custom_text.dart';
import 'package:taskify/common/widgets/height_spacer.dart';
import 'package:taskify/features/todo/controllers/dates/dates_provider.dart';
import 'package:taskify/features/todo/controllers/todo_provider.dart';

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
    var scheduleStartTime = ref.watch(startTimeStateProvider);
    var scheduleFinishTime = ref.watch(finishTimeStateProvider);
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
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(2023, 6, 01, 50),
                      maxTime: DateTime(2024, 6, 7, 09),
                      onConfirm: (startTime) {
                        ref.read(startTimeStateProvider.notifier).setStartTime(
                              startTime.toString(),
                            );
                      },
                      locale: picker.LocaleType.en,
                    );
                  },
                  width: AppConsts.kWidth * 0.4,
                  height: 52.h,
                  color: AppConsts.kLight,
                  color2: AppConsts.kBlueLight,
                  text: scheduleStartTime == ""
                      ? "Start Time"
                      : scheduleStartTime.substring(
                          10,
                          16,
                        ),
                ),
                CustomOutlnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(2023, 6, 01, 50),
                      maxTime: DateTime(2024, 6, 7, 09),
                      onConfirm: (finishTime) {
                        ref
                            .read(
                              finishTimeStateProvider.notifier,
                            )
                            .setFinishTime(
                              finishTime.toString(),
                            );
                      },
                      locale: picker.LocaleType.en,
                    );
                  },
                  width: AppConsts.kWidth * 0.4,
                  height: 52.h,
                  color: AppConsts.kLight,
                  color2: AppConsts.kBlueLight,
                  text: scheduleFinishTime == ""
                      ? "End Time"
                      : scheduleFinishTime.substring(
                          10,
                          16,
                        ),
                ),
              ],
            ),
            const HeightSpacer(
              hieght: 20,
            ),
            CustomOutlnBtn(
              onTap: () {
                if (title.text.isNotEmpty &&
                    desc.text.isNotEmpty &&
                    scheduleFinishTime.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    scheduleStartTime.isNotEmpty) {
                  TaskModel taskModel = TaskModel(
                    title: title.text,
                    desc: desc.text,
                    isCompleted: 0,
                    date: scheduleDate,
                    startTime: scheduleStartTime.substring(
                      10,
                      16,
                    ),
                    endTime: scheduleFinishTime.substring(
                      10,
                      16,
                    ),
                    remind: 0,
                    repeat: "yes",
                  );

                  ref.read(todoStateProvider.notifier).addTodo(taskModel);
                  ref.read(finishTimeStateProvider.notifier).setFinishTime("");
                  ref.read(startTimeStateProvider.notifier).setStartTime("");
                  ref.read(dateStateProvider.notifier).setDate("");
                  Navigator.pop(context);
                } else {
                  print("failed to add task");
                }
              },
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
