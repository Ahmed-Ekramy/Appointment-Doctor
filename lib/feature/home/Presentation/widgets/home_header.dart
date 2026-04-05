import '../../../../core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    String? username = CacheHelper.getData(key: 'username');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${username ?? 'Omar'}!',
              style: AppTextStyle.bold18(
                context,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'How Are you Today?',
              style: AppTextStyle.regular12(
                context,
              ).copyWith(color: AppColors.grey60),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                color: AppColors.grey100,
                size: 24.sp,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5.w),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
