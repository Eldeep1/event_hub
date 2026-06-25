import 'package:event_hub/data/model/event_model.dart';

enum EventTab { upcoming, past }

class EventsState {
  final EventTab selectedTab;
  final List<EventModel> events;
  final bool isLoading;

  EventsState({
    required this.selectedTab,
    required this.events,
    this.isLoading = false,
  });

  EventsState copyWith({
    EventTab? selectedTab,
    List<EventModel>? events,
    bool? isLoading,
  }) {
    return EventsState(
      selectedTab: selectedTab ?? this.selectedTab,
      events: events ?? this.events,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}