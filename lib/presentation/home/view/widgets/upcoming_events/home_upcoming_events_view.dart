import 'package:event_hub/presentation/home/view/widgets/upcoming_events/home_upcoming_events_card.dart';
import 'package:event_hub/presentation/home/view/widgets/upcoming_events/home_upcoming_events_title.dart';
import 'package:event_hub/presentation/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUpcomingEventsView extends StatelessWidget {
  const HomeUpcomingEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. The Title (Keep padding only for the title)
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: HomeUpcomingEventsTitle(),
        ),
        const SizedBox(height: 16),
        
        // 2. The Horizontal List View
        SizedBox(
          height: 270, // Fixed height for the cards
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            itemCount: cubit.events.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return EventCard(
                eventModel: cubit.events[index],
              );
            },
          ),
        ),
      ],
    );
  }
}