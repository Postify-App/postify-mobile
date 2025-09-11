part of 'bottom_nav_cubit.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavInitial extends BottomNavState {}

class BottomNavSuccess extends BottomNavState {}
