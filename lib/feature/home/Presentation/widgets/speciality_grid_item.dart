import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class SpecialityGridItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const SpecialityGridItem({
    required this.name,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.h,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(imagePath, width: 40.w, height: 40.h),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          name,
          style: AppTextStyle.medium12(
            context,
          ).copyWith(color: AppColors.grey100),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}