import 'package:doc/feature/home/Presentation/manager/home_cubit.dart';
import 'package:doc/feature/home/Presentation/manager/home_state.dart';
import 'package:doc/feature/home/Presentation/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/routes/route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

List<String> doctorImages = [
  AppImages.doctor1,
  AppImages.doctor2,
  AppImages.doctor3,
  AppImages.doctor4,
  AppImages.doctor5,
  AppImages.doctor6,
  AppImages.doctor7,
  AppImages.doctor8,
  AppImages.doctor9,
  AppImages.doctor10,
];

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recommendation Doctor', style: AppTextStyle.bold18(context)),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.recommendationDoctor),
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
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is GetDoctorsLoading ||
              current is GetDoctorsSuccess ||
              current is GetDoctorsError,
          builder: (context, state) {
            if (state is GetDoctorsError) {
              return Center(child: Text(state.error));
            }
            return Skeletonizer(
              enabled: state is GetDoctorsLoading,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state is GetDoctorsSuccess ? 7 : 7,
                itemBuilder: (context, index) {
                  final doctor = state is GetDoctorsSuccess
                      ? state.doctors[index]
                      : null;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: RecommendationDoctorItem(
                      name: doctor?.name ?? 'Doctor Name',
                      subtitle: doctor != null
                          ? '${doctor.specialization?.name} | ${doctor.city?.name}'
                          : 'Specialization | City',
                      rating: '4.8',
                      reviews: '(4,279 reviews)',
                      image: doctor?.photo,
                      assetImage: doctorImages[index % doctorImages.length],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
