import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildOrganizerTile extends StatelessWidget {
  const BuildOrganizerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://i.pravatar.cc/150?img=11', 
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigate to organizer profile page
              Navigator.pushNamed(context, '/organizer_profile');
            },
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
                  context.tr('organizer'),
                  style: TextStyle(fontSize: 13, color: Color(0xFF747688)),
                ),
              ],
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF5B67FA).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            context.tr('follow'),
            style: TextStyle(
              color: Color(0xFF5B67FA),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
