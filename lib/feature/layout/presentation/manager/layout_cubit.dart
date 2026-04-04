import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/Presentation/page/home_view.dart';


part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const Center(child: Text('Chat Screen')),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('My Appointment Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  void changeTab(int index) {
    currentIndex = index;
    emit(LayoutTabChanged(index));
  }
}
