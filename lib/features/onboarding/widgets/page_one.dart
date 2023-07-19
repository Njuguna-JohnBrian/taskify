import 'package:flutter/material.dart';
import 'package:taskify/common/utils/constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.kHeight,
      width: AppConsts.kWidth,
      color: AppConsts.kBkDark,
    );
  }
}
