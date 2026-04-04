import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';
import '../widgets/speciality_grid_item.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> specialities = [
      {'name': 'General', 'image': AppImages.general},
      {'name': 'ENT', 'image': AppImages.ent},
      {'name': 'Pediatric', 'image': AppImages.pediatric},
      {'name': 'Urologist', 'image': AppImages.urologist},
      {'name': 'Dentistry', 'image': AppImages.dentistry},
      {'name': 'Intestine', 'image': AppImages.intestine},
      {'name': 'Histologist', 'image': AppImages.histologist},
      {'name': 'Hepatology', 'image': AppImages.hepatology},
      {'name': 'Cardiologist', 'image': AppImages.cardiologist},
      {'name': 'Neurologic', 'image': AppImages.brain},
      {'name': 'Pulmonary', 'image': AppImages.pulmonary},
      {'name': 'Optometry', 'image': AppImages.optometry},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.r),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey10),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.grey100,
                size: 18.sp,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text('Doctor Speciality', style: AppTextStyle.bold18(context)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 24.h,
            childAspectRatio: 0.8,
          ),
          itemCount: specialities.length,
          itemBuilder: (context, index) {
            return SpecialityGridItem(
              name: specialities[index]['name']!,
              imagePath: specialities[index]['image']!,
            );
          },
        ),
      ),
    );
  }
}
