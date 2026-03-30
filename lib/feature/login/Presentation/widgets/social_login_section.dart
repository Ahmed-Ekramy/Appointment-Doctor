import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.grey10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'Or sign in with',
                style: AppTextStyle.regular12(context).copyWith(
                  color: AppColors.grey40,
                ),
              ),
            ),
            const Expanded(child: Divider(color: AppColors.grey10)),
          ],
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialIcon(
              iconPath: FontAwesomeIcons.google, // Placeholder
              onTap: () {},
              iconColor: Colors.red,
            ),
            SizedBox(width: 20.w),
            _SocialIcon(
              iconPath: FontAwesomeIcons.facebook, // Placeholder
              onTap: () {},
              iconColor: AppColors.primary,
            ),
            SizedBox(width: 20.w),
            _SocialIcon(
              iconPath: FontAwesomeIcons.apple, // Placeholder
              onTap: () {},
              iconColor: AppColors.backgroundBlack,
            ),
          ],
        ),
      ],
    );
  }
}
class _SocialIcon extends StatelessWidget {
  final FaIconData iconPath;
  final Color iconColor;
  final VoidCallback onTap;

  const _SocialIcon({required this.iconPath, required this.onTap, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade100,
        ),
        child: CircleAvatar(
          radius: 14.r,
          backgroundColor: Colors.transparent,
          child: FaIcon(
            iconPath,
            color: iconColor,
            size: 24.sp,
          ),
        ),
      ),
    );
  }

}