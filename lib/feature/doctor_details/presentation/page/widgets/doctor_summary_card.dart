import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/responsive_size.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/app_images.dart';

import '../../../data/models/doctor_details_model.dart';

class DoctorSummaryCard extends StatelessWidget {
  final Data? doctor;
  const DoctorSummaryCard({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: doctor?.photo != null
                ? Image.network(
                    doctor!.photo!,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      AppImages.doctor1,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.fill,
                    ),
                  )
                : Image.asset(
                    AppImages.doctor1,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.name ?? 'Doctor Name',
                  style: AppTextStyle.bold18(context),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${doctor?.specialization?.name} | ${doctor?.city?.name}',
                  style: AppTextStyle.regular14(context).copyWith(color: const Color(0xFF757575)),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.moneyBill1,
                      color: Color(0xFFFFC107),
                      size: 16,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Appointment Price: ${doctor?.appointPrice} \$',
                      style: AppTextStyle.medium12(context).copyWith(color: const Color(0xFF212121)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
