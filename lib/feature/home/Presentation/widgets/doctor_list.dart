import 'package:doc/core/utils/app_images.dart';
import 'package:doc/core/utils/responsive_size.dart';
import 'package:doc/feature/home/Presentation/manager/home_cubit.dart';
import 'package:doc/feature/home/Presentation/manager/home_state.dart';
import 'package:doc/feature/home/Presentation/widgets/doctor_error_view.dart';
import 'package:doc/feature/home/Presentation/widgets/doctor_empty_search_view.dart';
import 'package:doc/feature/home/Presentation/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  static const List<String> _doctorImages = [
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, current) =>
          current is GetDoctorsLoading ||
          current is GetDoctorsSuccess ||
          current is GetDoctorsError ||
          current is SearchDoctorsSuccess,
      builder: (context, state) {
        // ── Error ────────────────────────────────────────────────────────────
        if (state is GetDoctorsError) {
          return DoctorErrorView(message: state.error);
        }

        final isLoading = state is GetDoctorsLoading;

        // ── Resolve the list to display ──────────────────────────────────────
        final doctors = switch (state) {
          GetDoctorsSuccess s => s.doctors,
          SearchDoctorsSuccess s => s.doctors,
          _ => List<dynamic>.filled(7, null), // skeleton placeholders
        };

        // ── Empty search result ──────────────────────────────────────────────
        if (!isLoading && doctors.isEmpty) {
          return const DoctorEmptySearchView();
        }

        return Skeletonizer(
          enabled: isLoading,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
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
                  assetImage: _doctorImages[index % _doctorImages.length],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
