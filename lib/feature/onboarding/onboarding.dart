import 'package:doc/core/utils/responsive_size.dart';
import 'package:doc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.logo),
                    SizedBox(width: 10),
                    SvgPicture.asset(AppImages.docDoc),
                  ],
                ),
                SizedBox(height: 30.h),
                Stack(
                  children: [
                    SvgPicture.asset(
                      AppImages.logoLowOpacity,
                      width: 440.w,
                      height: 440.h,
                    ),
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white10],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.14, 0.4],
                        ),
                      ),
                      child: Image.asset(AppImages.doctor, height: 490.h),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,

                      child: Column(
                        children: [
                          Text(
                            "Best Doctor\nAppointment App",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bold32(
                              context,
                            ).copyWith(color: AppColors.primary, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Column(
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily\nwith Docdoc to get a new experience.",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular16(
                          context,
                        ).copyWith(color: AppColors.grey60),
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.backgroundWhite,
                        text: ' Get Started ',
                        onPressed: () {},
                        width: double.infinity,
                        height: 52,
                        radius: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


