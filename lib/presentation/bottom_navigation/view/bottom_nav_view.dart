import 'package:event_hub/presentation/bottom_navigation/cubit/bottom_nav_cubit.dart';
import 'package:event_hub/presentation/bottom_navigation/cubit/bottom_nav_states.dart';
import 'package:event_hub/presentation/bottom_navigation/view/widgets/bottom_nav_icon_view.dart';
import 'package:event_hub/presentation/events_view/view/events_view.dart';
import 'package:event_hub/presentation/home/view/home_view.dart';
import 'package:event_hub/presentation/profile_view/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({super.key});

  final List<Widget> _pages = [
    const HomeView(),
    const EventsPage(),
    const Center(child: Text("Map View", style: TextStyle(fontSize: 24))),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavChanged) {
            currentIndex = state.index;
          }
          return Scaffold(
            extendBody: true,
            body: _pages[currentIndex],

            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BottomNavIcon(
                      icon: Icons.explore,
                      label: 'Explore',
                      isActive: currentIndex == 0,
                      onTap: () => context.read<BottomNavCubit>().changeTab(0),
                    ),
                  ),
                  Expanded(
                    child: BottomNavIcon(
                      icon: Icons.calendar_today,
                      label: 'Events',
                      isActive: currentIndex == 1,
                      onTap: () => context.read<BottomNavCubit>().changeTab(1),
                    ),
                  ),
                  const Spacer(), // FAB space
                  Expanded(
                    child: BottomNavIcon(
                      icon: Icons.location_on,
                      label: 'Map',
                      isActive: currentIndex == 2,
                      onTap: () => context.read<BottomNavCubit>().changeTab(2),
                    ),
                  ),
                  Expanded(
                    child: BottomNavIcon(
                      icon: Icons.person,
                      label: 'Profile',
                      isActive: currentIndex == 3,
                      onTap: () => context.read<BottomNavCubit>().changeTab(3),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
