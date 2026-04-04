import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class SpecialityItem extends StatelessWidget {
  final String label;
  final   String imagePath;
  const SpecialityItem({
    super.key, required this.label, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 32.w,
              height: 32.h,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          label,
          style: AppTextStyle.medium12(context).copyWith(
            color: AppColors.grey100,
          ),
        ),
      ],
    );
  }
}