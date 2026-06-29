import 'package:flutter/material.dart';

Widget buildReviewsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Rocks Velkeinjen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF120D26),
                    ),
                  ),
                ),
                Text(
                  '10 Feb',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => const Icon(Icons.star, color: Colors.orange, size: 16),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF3F3849),
              ),
            ),
          ],
        );
      },
    );
  }
