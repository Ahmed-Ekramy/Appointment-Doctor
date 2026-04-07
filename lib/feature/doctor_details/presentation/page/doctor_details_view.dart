import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/responsive_size.dart';
import '../manager/doctor_details_cubit.dart';
import '../manager/doctor_details_state.dart';
import 'widgets/about_tab_view.dart';
import 'widgets/doctor_details_app_bar.dart';
import 'widgets/doctor_summary_card.dart';
import 'widgets/location_tab_view.dart';
import 'widgets/make_appointment_button.dart';
import 'widgets/reviews_tab_view.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DoctorDetailsFailure) {
          return Scaffold(
            body: Center(
              child: Text(state.errMessage),
            ),
          );
        } else if (state is DoctorDetailsSuccess) {
          final doctor = state.doctorDetailsModel.data;
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: const DoctorDetailsAppBar(),
              body: Column(
                children: [
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverToBoxAdapter(
                            child: DoctorSummaryCard(doctor: doctor),
                          ),
                          SliverPersistentHeader(
                            delegate: _TabBarDelegate(
                              child: TabBar(
                                labelColor: const Color(0xFF247CFF),
                                unselectedLabelColor: const Color(0xFF757575),
                                indicatorColor: const Color(0xFF247CFF),
                                indicatorWeight: 3.h,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                tabs: const [
                                  Tab(text: "About"),
                                  Tab(text: "Location"),
                                  Tab(text: "Reviews"),
                                ],
                              ),
                            ),
                            pinned: true,
                          ),
                        ];
                      },
                      body: TabBarView(
                        children: [
                          AboutTabView(
                            phone: doctor?.phone,
                            email: doctor?.email,
                            startTime: doctor?.startTime,
                            endTime: doctor?.endTime,
                            name: doctor?.name,
                            specialization: doctor?.specialization?.name,
                              description: doctor?.description),
                           LocationTabView(
                             address:doctor?.address,
                             locationCity:doctor?.city?.name,
                             locationGovernorate:doctor?.city!.governrate?.name,
                          ),
                          const ReviewsTabView(),
                        ],
                      ),
                    ),
                  ),
                  const MakeAppointmentButton(),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
  _TabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;
  @override
  double get minExtent => child.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
