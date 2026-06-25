import 'package:flutter/material.dart';

class HomeUpcomingEventsTitle extends StatelessWidget {
  const HomeUpcomingEventsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Text(
              "Upcoming Events",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              "See All",
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