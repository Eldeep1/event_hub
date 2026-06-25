import 'package:flutter/material.dart';

  Widget buildOrganizerTile() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://i.pravatar.cc/150?img=11', // Replace with organizer image
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ashfak Sayem',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF120D26),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Organizer',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF747688),
                ),
              ),
            ],
          ),
        ),
        // Follow Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF5B67FA).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Follow',
            style: TextStyle(
              color: Color(0xFF5B67FA),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
