import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:event_hub/presentation/events_view/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventRepository eventRepository;

  EventsCubit({required this.eventRepository})
    : super(EventsState(selectedTab: EventTab.upcoming, events: [])) {
    fetchEvents(EventTab.upcoming);
  }

  Future<void> switchTab(EventTab tab) async {
    if (state.selectedTab == tab) return;

    emit(state.copyWith(selectedTab: tab, isLoading: true));

    if (tab == EventTab.upcoming && state.upcomingEvents.isNotEmpty) {
      emit(state.copyWith(events: state.upcomingEvents, isLoading: false));
      return;
    }

    if (tab == EventTab.past && state.pastEvents.isNotEmpty) {
      emit(state.copyWith(events: state.pastEvents, isLoading: false));
      return;
    }

    await fetchEvents(tab);
  }

  Future<void> fetchEvents(EventTab tab) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final now = DateTime.now();
      if (tab == EventTab.upcoming) {
        final upcomingEvents = await eventRepository.getEvents(
          startDateTime: now,
          sortAsc: true,
        );
        emit(
          state.copyWith(
            upcomingEvents: upcomingEvents,
            events: upcomingEvents,
            isLoading: false,
          ),
        );
        return;
      }

      final pastEvents = await eventRepository.getEvents(
        endDateTime: now,
        sortAsc: false,
      );
      emit(
        state.copyWith(
          pastEvents: pastEvents,
          events: pastEvents,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
