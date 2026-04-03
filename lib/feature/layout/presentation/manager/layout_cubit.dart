import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  List<Widget> screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('My Appointment Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  void changeTab(int index) {
    currentIndex = index;
    emit(LayoutTabChanged(index));
  }
}
