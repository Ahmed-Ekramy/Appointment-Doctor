import 'package:doc/core/utils/app_colors.dart';
import 'package:doc/core/utils/responsive_size.dart';
import 'package:doc/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class DoctorEmptySearchView extends StatelessWidget {
  const DoctorEmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 56.sp,
            color: AppColors.grey20,
          ),
          SizedBox(height: 12.h),
          Text(
            'No doctors found',
            style: AppTextStyle.semiBold16(context)
                .copyWith(color: AppColors.grey60),
          ),
        ],
      ),
    );
  }
}
