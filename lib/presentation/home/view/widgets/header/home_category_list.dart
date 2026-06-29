import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:event_hub/domain/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem {
  final String label;
  final Color color;

  CategoryItem(this.label, this.color);
}

class HomeCategoryList extends StatefulWidget {
  HomeCategoryList({super.key});

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  List<CategoryItem> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final repo = RepositoryProvider.of<EventRepository>(context);
      final categories = await repo.getCategories();
      setState(() {
        _items = categories.map(_mapToItem).toList();
        _loading = false;
      });
    } catch (_) {
      // Fallback to hardcoded list on error
      setState(() {
        _items = [
          CategoryItem("Sports", const Color(0xFFF0635A)),
          CategoryItem("Music", const Color(0xFFF59762)),
          CategoryItem("Food", const Color(0xFF29D697)),
          CategoryItem("Art", const Color(0xFF46CDFB)),
        ];
        _loading = false;
      });
    }
  }

  CategoryItem _mapToItem(CategoryModel c) {
    final name = c.name;
    final lower = name.toLowerCase();
    Color color = Colors.blueGrey;
    if (lower.contains('music')) {
      color = const Color(0xFFF59762);
    } else if (lower.contains('sport')) {
      color = const Color(0xFFF0635A);
    } else if (lower.contains('food') || lower.contains('food & drink')) {
      color = const Color(0xFF29D697);
    } else if (lower.contains('art') || lower.contains('arts')) {
      color = const Color(0xFF46CDFB);
    } else if (lower.contains('film') || lower.contains('movie')) {
      color = const Color(0xFF8E8EFD);
    }

    return CategoryItem(name, color);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SizedBox(
        height: 40,
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = _items[index];

          return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: category.color,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: category.color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  category.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
