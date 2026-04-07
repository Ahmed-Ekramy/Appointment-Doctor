import 'package:flutter/material.dart';

import '../../../../../core/utils/text_style.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.bold16(context));
  }
}