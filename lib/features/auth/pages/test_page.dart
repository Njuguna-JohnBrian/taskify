import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/reusable_text.dart';
import 'package:taskify/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(
              text: code,
              style: appstyle(
                39,
                AppConsts.kLight,
                FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(codeStateProvider.notifier)
                    .setStart("Hello data is ${Random().nextInt(5000) + 200}");
              },
              child: const Text(
                "Press me",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
