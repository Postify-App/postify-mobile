// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postify/features/home/presentation/view/screen/home_screen.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());
  String? categoryId;

  List<Widget> get screens => [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  int currentIndex = 0;

  void changeScreen(int index) {
    emit(BottomNavInitial());
    currentIndex = index;
    emit(BottomNavSuccess());
  }
}
