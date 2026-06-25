
import 'package:flutter/material.dart';

class CategoryItem {
  final IconData icon;
  final String label;
  final Color color;

  CategoryItem(this.icon, this.label, this.color);
}

class HomeCategoryList extends StatelessWidget {
  HomeCategoryList({super.key});

  final List<CategoryItem> categories = [
    CategoryItem(Icons.sports_basketball, "Sports", const Color(0xFFF0635A)),
    CategoryItem(Icons.music_note, "Music", const Color(0xFFF59762)),
    CategoryItem(Icons.restaurant, "Food", const Color(0xFF29D697)),
    CategoryItem(Icons.palette, "Art", const Color(0xFF46CDFB)), 
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, 
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          
          return InkWell(
            onTap: () {
              
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: category.color,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: category.color.withOpacity(0.3), // Shadow matches pill color
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category.icon,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    category.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}