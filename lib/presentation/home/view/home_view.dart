import 'package:event_hub/presentation/home/view/widgets/header/home_header_view.dart';
import 'package:event_hub/presentation/home/view/widgets/invite_card/home_invite_friend_card.dart';
import 'package:event_hub/presentation/home/view/widgets/upcoming_events/home_upcoming_events_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1. Header
            HomeHeaderView(),
            //2. Upcoming Events
            const SizedBox(height: 20),
            HomeUpcomingEventsView(),
            const SizedBox(height: 30),
            HomeInviteFriendCard(),
          ],
        ),
      ),
    );
  }
}
