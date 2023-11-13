import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/custom_text.dart';
import 'package:taskify/common/widgets/expansion_tile.dart';
import 'package:taskify/common/widgets/height_spacer.dart';
import 'package:taskify/common/widgets/reusable_text.dart';
import 'package:taskify/features/todo/controllers/xpansion_provider.dart';
import 'package:taskify/features/todo/widgets/todo_tile.dart';
import '../../../common/widgets/width_spacer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Dashboard",
                      style: appstyle(
                        18,
                        AppConsts.kLight,
                        FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConsts.kLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            9,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: AppConsts.kBkDark,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpacer(
                hieght: 20,
              ),
              CustomTextField(
                hintText: "Search",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(
                    14.h,
                  ),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConsts.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConsts.kGreyLight,
                ),
              ),
              const HeightSpacer(
                hieght: 15,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: ListView(
            children: [
              const HeightSpacer(
                hieght: 25,
              ),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConsts.kLight,
                  ),
                  const WidthSpacer(
                    wydth: 10,
                  ),
                  ReusableText(
                    text: "Today's Task",
                    style: appstyle(
                      18,
                      AppConsts.kLight,
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const HeightSpacer(
                hieght: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppConsts.kLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppConsts.kRadius,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppConsts.kGreyLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        AppConsts.kRadius,
                      ),
                    ),
                  ),
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConsts.kBlueLight,
                  labelStyle: appstyle(
                    24,
                    AppConsts.kBlueLight,
                    FontWeight.bold,
                  ),
                  unselectedLabelColor: AppConsts.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConsts.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Pending",
                            style: appstyle(
                              16,
                              AppConsts.kBkDark,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 30.w,
                        ),
                        width: AppConsts.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Completed",
                            style: appstyle(
                              16,
                              AppConsts.kBkDark,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(
                hieght: 20,
              ),
              SizedBox(
                height: AppConsts.kHeight * 0.3,
                width: AppConsts.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppConsts.kRadius,
                    ),
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppConsts.kGreen,
                        height: AppConsts.kHeight * 0.3,
                        child: ListView(
                          children: [
                            TodoTile(
                              start: "03:00",
                              end: "05:00",
                              switcher: Switch(
                                value: true,
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: AppConsts.kBkLight,
                        height: AppConsts.kHeight * 0.3,
                      )
                    ],
                  ),
                ),
              ),
              const HeightSpacer(
                hieght: 20,
              ),
              XpansionTile(
                text: "Tomorrow's Task",
                text2: "Tomorrow's task are shown here",
                onExpansionChanged: (bool expanded) {
                  ref.watch(xpansionStateProvider.notifier).setState(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: ref.watch(xpansionStateProvider)
                      ? const Icon(
                          AntDesign.circledown,
                          color: AppConsts.kLight
                        )
                      : const Icon(
                          AntDesign.closecircleo,
                          color: AppConsts.kBlueLight,
                        ),
                ),
                children: [
                  TodoTile(
                    start: "03:00",
                    end: "05:00",
                    switcher: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              XpansionTile(
                text: DateTime.now()
                    .add(const Duration(days: 1))
                    .toString()
                    .substring(5, 10),
                text2: "Monday's task are shown here",
                onExpansionChanged: (bool expanded) {
                  ref
                      .watch(xpansionState0Provider.notifier)
                      .setState(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: ref.watch(xpansionState0Provider)
                      ? const Icon(
                      AntDesign.circledown,
                      color: AppConsts.kLight
                  )
                      : const Icon(
                    AntDesign.closecircleo,
                    color: AppConsts.kBlueLight,
                  ),
                ),
                children: [
                  TodoTile(
                    start: "03:00",
                    end: "05:00",
                    switcher: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
