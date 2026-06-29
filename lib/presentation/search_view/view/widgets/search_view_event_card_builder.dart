import 'package:event_hub/domain/model/search_event_model.dart';
import 'package:flutter/material.dart';

class SearchViewEventCardBuilder extends StatelessWidget {
  const SearchViewEventCardBuilder({super.key, required this.event});
  final SearchEventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              event.imageUrl,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event.date,
                  style: const TextStyle(
                    color: Color(0xFF5B67FA),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.title,
                  style: const TextStyle(
                    color: Color(0xFF120D26), 
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
