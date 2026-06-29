import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/presentation/events_view/view_model/events_cubit.dart';
import 'package:event_hub/presentation/events_view/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsViewToggleSwitch extends StatelessWidget {
  const EventsViewToggleSwitch({super.key, required this.currentTab});
  final EventTab currentTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3), // Light grey background
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildToggleButton(
              context: context,
              title: context.tr('upcoming_events'),
              isSelected: currentTab == EventTab.upcoming,
              onTap: () => context.read<EventsCubit>().switchTab(EventTab.upcoming),
            ),
          ),
          Expanded(
            child: _buildToggleButton(
              context: context,
              title: context.tr('past_events'),
              isSelected: currentTab == EventTab.past,
              onTap: () => context.read<EventsCubit>().switchTab(EventTab.past),
            ),
          ),
        ],
      ),
    );
  }
}


  Widget _buildToggleButton({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFF5B67FA) : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
