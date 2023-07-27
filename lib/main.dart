import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/features/onboarding/pages/onboarding.dart';
import 'package:taskify/features/todo/pages/homepage.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Taskify",
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            scaffoldBackgroundColor: AppConsts.kBkDark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
          home: const OnBoarding(),
        );
      },
    );
  }
}
