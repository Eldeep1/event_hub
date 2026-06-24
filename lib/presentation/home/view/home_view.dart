import 'package:event_hub/presentation/home/view/widgets/header/home_header_view.dart';
import 'package:event_hub/presentation/home/view/widgets/invite_card/home_invite_friend_card.dart';
import 'package:event_hub/presentation/home/view/widgets/upcoming_events/home_upcoming_events_view.dart';
import 'package:event_hub/presentation/home/view_model/home_cubit.dart';
import 'package:event_hub/presentation/home/view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..fetchEvents(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //1. Header
              HomeHeaderView(),
              //2. Upcoming Events
              const SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeSuccessState) {
                    return HomeUpcomingEventsView();
                  } else if (state is HomeErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 30),
              HomeInviteFriendCard(),
            ],
          ),
        ),
      ),
    );
  }
}
