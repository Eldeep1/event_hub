import 'package:flutter/material.dart';

Widget buildAboutTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Text(
          'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More',
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF3F3849),
          ),
        ),
      ],
    );
  }