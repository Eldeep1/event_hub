import 'package:flutter/material.dart';

class OverlappingAvatars extends StatelessWidget {
  const OverlappingAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    // A list of standard Flutter Colors to act as placeholder avatars
    final List<Color> avatarColors = [
      Colors.orangeAccent,
      Colors.pinkAccent,
      Colors.blueAccent,
    ];

    return Row(
      children: List.generate(
        avatarColors.length,
        (index) {
          return Align(
            // widthFactor < 1 causes the overlap. 
            // 0.7 means it only takes up 70% of its normal width.
            widthFactor: 0.7, 
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2), // White border separates them
              ),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: avatarColors[index],
                // child: Image.network('...'), // Add real images here later
              ),
            ),
          );
        },
      ),
    );
  }
}