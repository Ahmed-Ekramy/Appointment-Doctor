import 'package:doc/feature/home/Presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/responsive_size.dart';
import '../widgets/home_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/speciality_section.dart';
import '../widgets/recommendation_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                HomeHeader(),
                SizedBox(height: 10.h),
                PromoBanner(),
                SizedBox(height: 15.h),
                SpecialitySection(),
                SizedBox(height: 10.h),
                RecommendationSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
