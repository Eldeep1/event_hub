import 'package:event_hub/presentation/organizer_profile/view/widgets/organizer_profile_stat_column.dart';
import 'package:flutter/material.dart';

Widget buildProfileHeader() {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Avatar
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
        ),
        const SizedBox(height: 16),
        // Name
        const Text(
          'David Silbia',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF120D26),
          ),
        ),
        const SizedBox(height: 16),
        // Stats
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildStatColumn('350', 'Following'),
            Container(
              height: 30,
              width: 1,
              color: Colors.grey.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(horizontal: 24),
            ),
            buildStatColumn('346', 'Followers'),
          ],
        ),
        const SizedBox(height: 24),
        // Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add_alt_1, size: 18),
                  label: const Text('Follow'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B67FA),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline, size: 18),
                  label: const Text('Messages'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF5B67FA),
                    side: const BorderSide(color: Color(0xFF5B67FA)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }