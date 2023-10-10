import 'package:flutter/material.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/titles.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile({
    super.key,
    required this.text,
    required this.text2,
    this.onExpansionChanged,
    this.trailing,
    required this.children,
  });

  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppConsts.kBkLight,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppConsts.kRadius,
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: BottomTitles(
              text: text,
              text2: text2,
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: onExpansionChanged,
            controlAffinity: ListTileControlAffinity.trailing,
            trailing: trailing,
            children: children,
          ),
        ),
      ),
    );
  }
}
