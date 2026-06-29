import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/presentation/search_view/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewSearchBar extends StatefulWidget {
  const SearchViewSearchBar({super.key});

  @override
  State<SearchViewSearchBar> createState() => _SearchViewSearchBarState();
}

class _SearchViewSearchBarState extends State<SearchViewSearchBar> {
  Timer? _debounce;

  void _onChanged(String value) {
    // Immediate clear
    if (value.trim().isEmpty) {
      _debounce?.cancel();
      context.read<SearchCubit>().onSearchChanged('');
      return;
    }

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<SearchCubit>().onSearchChanged(value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Search Icon
          const Icon(Icons.search, color: Color(0xFF5B67FA), size: 28),
          const SizedBox(width: 12),
          // Text Field
          Expanded(
            child: TextField(
              onChanged: _onChanged,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: context.tr('search_hint'),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          // Filters Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF5B67FA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  context.tr('filters'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
