
import 'package:event_hub/presentation/event_details/view/widgets/event_details_info_tile.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_organizer_tile.dart';
import 'package:flutter/material.dart';

Widget buildEventDetails(dynamic eventModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Event Title
          const Text(
            'International Band\nMusic Concert',
            style: TextStyle(
              fontSize: 32,
              height: 1.2,
              color: Color(0xFF120D26),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),

          // Date & Time
          buildInfoTile(
            icon: Icons.calendar_month_rounded,
            title: '14 December, 2021',
            subtitle: 'Tuesday, 4:00PM - 9:00PM',
          ),
          const SizedBox(height: 16),

          // Location
          buildInfoTile(
            icon: Icons.location_on_rounded,
            title: 'Gala Convention Center',
            subtitle: '36 Guild Street London, UK',
          ),
          const SizedBox(height: 24),

          // Organizer Profile
          buildOrganizerTile(),
          const SizedBox(height: 24),

          // About Event
          const Text(
            'About Event',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF120D26),
            ),
          ),
          const SizedBox(height: 12),
          
          // Description Text
          const Text(
            'Enjoy your favorite dish and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF747688),
            ),
          ),
        ],
      ),
    );
  }


  