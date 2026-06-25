
  import 'package:flutter/material.dart';

Widget buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF120D26),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF747688)),
        ),
      ],
    );
  }