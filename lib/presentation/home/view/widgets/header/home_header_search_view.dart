

import 'package:flutter/material.dart';

class HomeHeaderSearchBar extends StatelessWidget {
  const HomeHeaderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. Left Side: Search Icon, Divider, and TextField
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              // The vertical divider
              Container(
                width: 1.5,
                height: 24,
                color: Colors.white.withOpacity(0.3),
              ),
              const SizedBox(width: 12),
              // The actual text input field
              Expanded(
                child: InkWell(
                  onTap: () {
                    
                     },
                  child: Container(
                    
                    color: Colors.transparent,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Search...",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16), // Space between search and filter button
        // 2. Right Side: Filters Button
        InkWell(
          onTap: () {
            
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12), // Pill background
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Inner circular background for the filter icon
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Filters",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4), // Padding on the right edge
              ],
            ),
          ),
        ),
      ],
    );
  }
}
