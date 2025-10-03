import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../home/ui/screens/home_screen.dart';
import '../../profile/ui/profile.dart';

part 'button_nav_bar_state.dart';

class ButtonNavBarCubit extends Cubit<ButtonNavBarState> {
  ButtonNavBarCubit() : super(ButtonNavBarInitial());
  static ButtonNavBarCubit get(context) => BlocProvider.of(context);
  int selectedIndex=0;
  List<Widget> screens = [
    HomeScreen(),
    Profile(),
    Center(child: Text('Chat Screen')),
    Center(child: Text('Settings Screen')),
  ];
  onTapButtonNav(int index){
    selectedIndex=index;
    emit(ButtonNavBarChangeState());
  }

}
