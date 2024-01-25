import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: inter14w400().copyWith(fontSize: 11.sp),
          ),
          TextSpan(
            text: ' ',
            style:  inter14w400().copyWith(fontSize: 11.sp),
          ),
          TextSpan(
            text: ' ',
            style: inter14w400().copyWith(fontSize: 11.sp),
          ),
          TextSpan(
              text: 'Terms & Conditions',
              style: inter11w500()
          ),
          TextSpan(
            text: ' ',
            style:  inter14w400().copyWith(fontSize: 11.sp),
          ),
          TextSpan(
            text: 'and',
            style: inter14w400().copyWith(fontSize: 11.sp),
          ),
          TextSpan(
            text: ' ',
            style:  inter14w400().copyWith(fontSize: 11.sp),
          ),
          TextSpan(
              text: 'PrivacyPolicy.',
              style: inter11w500()
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
