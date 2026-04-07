import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive_size.dart';
import '../../../../../core/utils/text_style.dart';

class MakeAppointmentButton extends StatelessWidget {
  const MakeAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF247CFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 0,
          ),
          child: Text(
            'Make An Appointment',
            style: AppTextStyle.semiBold16(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
