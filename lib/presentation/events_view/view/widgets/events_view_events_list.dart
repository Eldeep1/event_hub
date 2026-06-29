import 'package:event_hub/domain/model/event_model.dart';
import 'package:flutter/material.dart';

class EventsViewEventList extends StatelessWidget {
  const EventsViewEventList({super.key, required this.events});
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      itemCount: events.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final event = events[index];
        return GestureDetector(
          onTap: () {
            // Navigate to event details page
            Navigator.pushNamed(context, '/event_details', arguments: event);
          },
          child: _eventsCard(event),
        );
      },
    );
  }
}
Widget _eventsCard(EventModel event) {
  return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Event Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  event.imageUrl,
                  height: 90,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Event Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.date,
                      style: const TextStyle(
                        color: Color(0xFF5B67FA),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      event.title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            event.location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}