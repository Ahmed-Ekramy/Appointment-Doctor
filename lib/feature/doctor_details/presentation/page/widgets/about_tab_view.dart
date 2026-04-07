import 'package:doc/feature/doctor_details/presentation/page/widgets/section_title.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive_size.dart';
import '../../../../../core/utils/text_style.dart';

class AboutTabView extends StatelessWidget {
  final String? name;
  final String? specialization;
  final String? phone;
  final String? email;
  final String? description;
  final String? startTime;
  final String? endTime;

  const AboutTabView({
    super.key,
    this.description,
    this.startTime,
    this.endTime,
    this.name, this.specialization, this.phone, this.email,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'About me'),
          SizedBox(height: 8.h),
          Text(
            "$name  is the top most  $specialization specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation." ,
            style: AppTextStyle.regular14(
              context,
            ).copyWith(color: const Color(0xFF757575), height: 1.6),
          ),
          SizedBox(height: 24.h),
          const SectionTitle(title: 'Working Time'),
          SizedBox(height: 12.h),
          Text(
            (startTime != null && endTime != null)
                ? ' Monday - Friday,$startTime - $endTime'
                : 'Not specified',
            style: AppTextStyle.regular14(
              context,
            ).copyWith(color: const Color(0xFF757575)),
          ),
          SizedBox(height: 12.h),
          const SectionTitle(title: 'Contact Info'),
          SizedBox(height: 8.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Phone: $phone\n',
                  style: AppTextStyle.regular14(
                    context,
                  ).copyWith(color: const Color(0xFF757575)),
                ),
                TextSpan(
                  text: 'Email: $email\n',
                  style: AppTextStyle.regular14(
                    context,
                  ).copyWith(color: const Color(0xFF757575)),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}


