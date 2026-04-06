import 'package:doc/feature/home/Presentation/manager/home_cubit.dart';
import 'package:doc/feature/home/Presentation/manager/home_state.dart';
import 'package:doc/feature/home/Presentation/widgets/speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/routes/route.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

String getSpecialityImage(String? specialityName) {
  switch (specialityName?.toLowerCase()) {
    case 'cardiology':
      return AppImages.cardiologist;
    case 'dentistry':
      return AppImages.dentistry;
    case 'neurology':
      return AppImages.brain;
    case 'otolaryngology':
      return AppImages.ent;
    case 'gastroenterology':
      return AppImages.intestine;
    case 'hepatology':
      return AppImages.hepatology;
    case 'ophthalmology':
      return AppImages.optometry;
    case 'pediatrics':
      return AppImages.pediatric;
    case 'urology':
      return AppImages.urologist;
    case 'dermatology':
      return AppImages.histologist;
      case 'orthopedics':
      return AppImages.orthopedics;
    case 'psychiatry':
      return AppImages.psychiatry;
    case 'pulmonology':
      return AppImages.pulmonary;
    default:
      return AppImages.general;
  }
}

class SpecialitySection extends StatelessWidget {
  const SpecialitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Doctor Specialization',
              style: AppTextStyle.bold18(context),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.speciality);
              },
              child: Text(
                'See All',
                style: AppTextStyle.semiBold12(context).copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is GetSpecialtyLoading ||
              current is GetSpecialtySuccess ||
              current is GetSpecialtyError,
          builder: (context, state) {
            if (state is GetSpecialtyError) {
              return Center(child: Text(state.error));
            }
            return Skeletonizer(
              enabled: state is GetSpecialtyLoading,
              child: SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state is GetSpecialtySuccess
                      ? state.specializationData.length
                      : 8,
                  itemBuilder: (context, index) {
                    final speciality = state is GetSpecialtySuccess
                        ? state.specializationData[index]
                        : null;
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: SpecialityItem(
                        label: speciality?.name ?? '     Specialization       ',
                        imagePath: getSpecialityImage(speciality?.name) ,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
