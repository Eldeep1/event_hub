import 'package:flutter/material.dart';

class EventsViewEmptyState extends StatelessWidget {
  const EventsViewEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Placeholder for your illustration asset
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.calendar_month, size: 100, color: Colors.blue),
          ),
          const SizedBox(height: 32),
          const Text(
            'No Upcoming Event',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Stay tuned! We\'ll notify you when new events are available.',
            textAlign: TextAlign.center,
            style: TextStyle(
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
