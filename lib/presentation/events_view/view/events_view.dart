import 'package:event_hub/presentation/events_view/view/widgets/events_view_empty_state.dart';
import 'package:event_hub/presentation/events_view/view/widgets/events_view_events_list.dart';
import 'package:event_hub/presentation/events_view/view/widgets/events_view_toggle_switch.dart';
import 'package:event_hub/presentation/events_view/view_model/events_cubit.dart';
import 'package:event_hub/presentation/events_view/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Events',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<EventsCubit, EventsState>(
          builder: (context, state) {
            return Column(
              children: [
                EventsViewToggleSwitch(currentTab: state.selectedTab),
                const SizedBox(height: 16),
                Expanded(
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state.events.isEmpty
                      ? EventsViewEmptyState()
                      : EventsViewEventList(events: state.events),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
