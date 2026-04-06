import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/text_style.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import '../widgets/speciality_grid_item.dart';
import '../widgets/speciality_section.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('Doctor Specialization', style: AppTextStyle.bold18(context)),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
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
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 24.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: state is GetSpecialtySuccess
                    ? state.specializationData.length
                    : 12,
                itemBuilder: (context, index) {
                  final speciality = state is GetSpecialtySuccess
                      ? state.specializationData[index]
                      : null;
                  return SpecialityGridItem(
                    name: speciality?.name ?? 'Specialization',
                    imagePath: getSpecialityImage(speciality?.name),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
