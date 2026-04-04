import 'package:doc/feature/home/Presentation/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Recommendation Doctor', style: AppTextStyle.bold18(context)),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: AppTextStyle.semiBold12(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),

                    child: RecommendationDoctorItem(
                      name: 'Dr. Shahnaz Sullivan',
                      subtitle: 'General | RSUD Gatot Subroto',
                      rating: '4.8',
                      reviews: '(4,279 reviews)',
                    )
                );
              }
          )
        ]
    );
  }
}
