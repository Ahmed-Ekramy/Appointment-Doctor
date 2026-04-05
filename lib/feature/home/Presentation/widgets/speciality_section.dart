import 'package:doc/feature/home/Presentation/manager/home_cubit.dart';
import 'package:doc/feature/home/Presentation/manager/home_state.dart';
import 'package:doc/feature/home/Presentation/widgets/speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/route.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';

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
              'Doctor Speciality',
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
            if (state is GetSpecialtyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetSpecialtySuccess) {
              return SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.specializationData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: SpecialityItem(
                        label: state.specializationData[index].name,
                        imagePath: AppImages.general,
                      ),
                    );
                  },
                ),
              );
            } else if (state is GetSpecialtyError) {
              return Center(child: Text(state.error));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
