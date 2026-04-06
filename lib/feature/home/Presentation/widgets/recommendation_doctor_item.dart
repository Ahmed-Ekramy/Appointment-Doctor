import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class RecommendationDoctorItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String rating;
  final String reviews;
  final String? image;
  final String? assetImage;

  const RecommendationDoctorItem({
    super.key,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.reviews,
    this.image,
    this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: assetImage != null
              ? Image.asset(
                  assetImage!,
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                )
              : image != null && image!.isNotEmpty
                  ? Image.network(
                      image!,
                      width: 110.w,
                      height: 110.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        AppImages.doctor,
                        width: 110.w,
                        height: 110.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      AppImages.doctor,
                      width: 110.w,
                      height: 110.h,
                      fit: BoxFit.cover,
                    ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: AppColors.grey100),
              ),
              SizedBox(height: 8.w),
              Text(
                subtitle,
                style: AppTextStyle.medium12(
                  context,
                ).copyWith(color: AppColors.grey60),
              ),
              SizedBox(height: 12.w),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 4.w),
                  Text(
                    rating,
                    style: AppTextStyle.medium12(
                      context,
                    ).copyWith(color: AppColors.grey100),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    reviews,
                    style: AppTextStyle.regular12(
                      context,
                    ).copyWith(color: AppColors.grey60),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
