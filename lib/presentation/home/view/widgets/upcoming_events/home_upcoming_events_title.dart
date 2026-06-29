import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeUpcomingEventsTitle extends StatelessWidget {
  const HomeUpcomingEventsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Text(
              context.tr("upcoming_events"),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              context.tr("see_all"),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey[600],
              ),
              
          ],
        );
  }
}