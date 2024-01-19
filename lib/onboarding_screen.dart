import 'package:appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Image_doc.dart';
import 'core/theming/app_text.dart';
import 'doc_logo_and_name.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const DocLogoName(),
              SizedBox(
                height: 30.h,
              ),
              const ImageDoc(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      textAlign: TextAlign.center,
                      style: inter13w400(),
                    ),
                    SizedBox(height: 30.h,),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all(ColorManager.primaryColor),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: MaterialStateProperty.all(Size(double.infinity,50.h))
                        ),
                        onPressed: () {

                        }, child: Text("Get Started",style: inter16w600(),)),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
