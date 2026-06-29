import 'package:event_hub/presentation/events_view/view_model/states.dart';
import 'package:flutter/material.dart';

class EventsViewEmptyState extends StatelessWidget {
  const EventsViewEmptyState({super.key, required this.tab});
  final EventTab tab;

  @override
  Widget build(BuildContext context) {
    final isPastTab = tab == EventTab.past;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_month,
              size: 100,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            isPastTab ? 'No Past Events' : 'No Upcoming Event',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isPastTab
                ? 'There are no past events to show right now.'
                : 'Stay tuned! We\'ll notify you when new events are available.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
