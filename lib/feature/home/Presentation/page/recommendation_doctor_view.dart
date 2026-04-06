import 'package:doc/feature/home/Presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';

import '../widgets/doctor_list.dart';
import '../widgets/recommendation_app_bar.dart';
import '../widgets/search_bar.dart';


class RecommendationDoctorView extends StatelessWidget {
  const RecommendationDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getDoctors();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RecommendationAppBar(),
      body: const Column(
        children: [
          SearchBarDoc(),
          Expanded(child: DoctorList()),
        ],
      ),
    );
  }
}

