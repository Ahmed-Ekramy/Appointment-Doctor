import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../manager/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeTab(index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey60,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.home,
                    colorFilter: const ColorFilter.mode(
                      AppColors.grey60,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.homeSelected,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.search,
                    colorFilter: const ColorFilter.mode(
                      AppColors.grey60,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.search,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.calendar,
                    colorFilter: const ColorFilter.mode(
                      AppColors.grey60,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.calendarSelected,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_outline),
                  activeIcon: const Icon(
                    Icons.person,
                    color: AppColors.primary,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
