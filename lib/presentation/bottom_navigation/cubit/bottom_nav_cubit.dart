import 'package:event_hub/presentation/bottom_navigation/cubit/bottom_nav_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  void changeTab(int index) => emit(BottomNavChanged(index));


}