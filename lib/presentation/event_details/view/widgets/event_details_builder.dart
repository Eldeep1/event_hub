import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_info_tile.dart';
import 'package:event_hub/presentation/event_details/view/widgets/event_details_organizer_tile.dart';
import 'package:flutter/material.dart';

Widget buildEventDetails(BuildContext context, EventModel eventModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          eventModel.title,
          style: const TextStyle(
            fontSize: 32,
            height: 1.2,
            color: Color(0xFF120D26),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),

        buildInfoTile(
          icon: Icons.calendar_month_rounded,
          title: eventModel.date,
          subtitle: eventModel.time,
        ),
        const SizedBox(height: 16),

        buildInfoTile(
          icon: Icons.location_on_rounded,
          title: eventModel.location,
          subtitle: eventModel.organizerName.isNotEmpty
              ? eventModel.organizerName
              : context.tr('location_details'),
        ),
        const SizedBox(height: 24),

        const BuildOrganizerTile(),
        const SizedBox(height: 24),

        Text(
          context.tr('about_event'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF120D26),
          ),
        ),
        const SizedBox(height: 12),

        Text(
          eventModel.description.isNotEmpty
              ? eventModel.description
              : context.tr('no_description_available'),
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF747688),
          ),
        ),
      ],
    ),
  );
}
