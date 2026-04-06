import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class RecommendationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RecommendationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 5.w),
        padding:  EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey10),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.grey100,
            size: 18.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      title: Text(
        'Recommendation Doctor',
        style: AppTextStyle.bold18(context),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Icon(
            Icons.more_horiz,
            color: AppColors.grey100,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}