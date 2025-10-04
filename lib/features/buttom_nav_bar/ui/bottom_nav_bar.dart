import 'package:curaa/features/delivary/ui/delivery_screen.dart';
import 'package:curaa/features/home/ui/screens/home_screen.dart';
import 'package:curaa/features/profile/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../map/ui/map_screen.dart';
import '../logic/button_nav_bar_cubit.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    HomeScreen(),
    DeliveryScreen(),
    MapScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ButtonNavBarCubit>();
    return BlocBuilder<ButtonNavBarCubit, ButtonNavBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.selectedIndex,
            type: BottomNavigationBarType.shifting,

            showSelectedLabels: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            onTap: (int index) {
              cubit.onTapButtonNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm_on_outlined, color: Colors.white),
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined, color: Colors.white),
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white),
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: '',
              ),
            ],
          ),
          body: screens[cubit.selectedIndex],
        );
      },
    );
  }
}
