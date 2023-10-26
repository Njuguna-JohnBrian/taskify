import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/height_spacer.dart';
import 'package:taskify/common/widgets/reusable_text.dart';
import 'package:taskify/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    this.color,
    this.title,
    this.description,
    this.start,
    this.end,
    this.editWidget,
    this.delete,
    this.switcher,
  });

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(
              0.h,
            ),
            width: AppConsts.kWidth,
            decoration: BoxDecoration(
              color: AppConsts.kGreyLight,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppConsts.kRadius,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppConsts.kRadius,
                          ),
                        ),
                        // TODO: Make colors dynamic
                        color: color ?? AppConsts.kRed,
                      ),
                    ),
                    const WidthSpacer(
                      wydth: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        8.h,
                      ),
                      child: SizedBox(
                        width: AppConsts.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? "Title of the Todo",
                              style: appstyle(
                                18,
                                AppConsts.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            const HeightSpacer(
                              hieght: 3,
                            ),
                            ReusableText(
                              text: description ?? "Description of the Todo",
                              style: appstyle(
                                12,
                                AppConsts.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            const HeightSpacer(
                              hieght: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConsts.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.3,
                                      color: AppConsts.kGreyDK,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        AppConsts.kRadius,
                                      ),
                                    ),
                                    color: AppConsts.kBkDark,
                                  ),
                                  child: Center(
                                    child: ReusableText(
                                      text: "$start |  $end",
                                      style: appstyle(
                                        12,
                                        AppConsts.kLight,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                const WidthSpacer(
                                  wydth: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(
                                      wydth: 20,
                                    ),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                        MaterialCommunityIcons.delete_circle,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 0.h,
                    right: 2,
                  ),
                  child: switcher,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
