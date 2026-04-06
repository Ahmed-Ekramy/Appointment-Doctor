import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.tune_rounded,
      color: AppColors.backgroundBlack,
      size: 26.sp,
    );
  }
}