import 'package:event_hub/presentation/home/view/widgets/upcoming_events/home_upcoming_events_card.dart';
import 'package:event_hub/presentation/home/view/widgets/upcoming_events/home_upcoming_events_title.dart';
import 'package:flutter/material.dart';

class HomeUpcomingEventsView extends StatelessWidget {
  const HomeUpcomingEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data to feed the list
    final List<Color> cardColors = [
      const Color(0xFFFFDCD8), // Light Peach/Pink
      const Color(0xFFC1E5FF), // Light Blue
    ];

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
            itemCount: cardColors.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return EventCard(
                imageBackgroundColor: cardColors[index],
                title: index == 0 ? "International Band Mu..." : "Jo Malone London",
                location: index == 0 ? "36 Guild Street London, UK" : "Radius Gallery",
              );
            },
          ),
        ),
      ],
    );
  }
}