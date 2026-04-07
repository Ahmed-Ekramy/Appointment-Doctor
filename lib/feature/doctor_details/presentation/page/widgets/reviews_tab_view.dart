import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive_size.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/app_images.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(24.r),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
      itemBuilder: (context, index) => const _ReviewItem(),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundImage: const AssetImage(AppImages.doctor2), // Placeholder avatar
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jane Cooper',
                    style: AppTextStyle.bold16(context),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Today',
              style: AppTextStyle.regular12(context).copyWith(color: const Color(0xFF9E9E9E)),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors.',
          style: AppTextStyle.regular14(context).copyWith(color: const Color(0xFF757575), height: 1.5),
        ),
      ],
    );
  }
}
