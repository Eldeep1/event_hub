import 'package:event_hub/domain/model/event_model.dart';

enum EventTab { upcoming, past }

class EventsState {
  final EventTab selectedTab;
  final List<EventModel> events;
  final List<EventModel> upcomingEvents;
  final List<EventModel> pastEvents;
  final bool isLoading;
  final String? errorMessage;

  EventsState({
    required this.selectedTab,
    required this.events,
    this.upcomingEvents = const [],
    this.pastEvents = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  EventsState copyWith({
    EventTab? selectedTab,
    List<EventModel>? events,
    List<EventModel>? upcomingEvents,
    List<EventModel>? pastEvents,
    bool? isLoading,
    String? errorMessage,
  }) {
    return EventsState(
      selectedTab: selectedTab ?? this.selectedTab,
      events: events ?? this.events,
      upcomingEvents: upcomingEvents ?? this.upcomingEvents,
      pastEvents: pastEvents ?? this.pastEvents,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
