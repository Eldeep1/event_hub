
import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/presentation/events_view/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit()
      : super(EventsState(selectedTab: EventTab.upcoming, events: [])) {
    // Initialize by loading the default tab (upcoming)
    fetchEvents(EventTab.upcoming);
  }

  void switchTab(EventTab tab) {
    if (state.selectedTab == tab) return;
    
    emit(state.copyWith(selectedTab: tab, isLoading: true));
    fetchEvents(tab);
  }

  void fetchEvents(EventTab tab) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    if (tab == EventTab.upcoming) {
      
      emit(state.copyWith(events: [], isLoading: false));
    } else {
      
      final mockPastEvents = [
        EventModel(
          title: 'Jo Malone London’s Mother’s Day Presents',
          date: 'Wed, Apr 28 • 5:30 PM',
          location: 'Radius Gallery • Santa Cruz, CA',
          imageUrl: 'https://i.pravatar.cc/150?img=1', 
          description: '', 
          time: '', price: 200, organizerName: '', 
        ),
        EventModel(
          title: 'A Virtual Evening of Smooth Jazz',
          date: 'Sat, May 1 • 2:00 PM',
          location: 'Lot 13 • Oakland, CA',
          imageUrl: 'https://i.pravatar.cc/150?img=2',
           description: '', time: '', price: 399, organizerName: '',
        ),
        EventModel(
          title: 'Women\'s Leadership Conference 2021',
          date: 'Sat, Apr 24 • 1:30 PM',
          location: '53 Bush St • San Francisco, CA',
          imageUrl: 'https://i.pravatar.cc/150?img=3', 
          description: '', time: '', price: 500, organizerName: '',
        ),
      ];
      emit(state.copyWith(events: mockPastEvents, isLoading: false));
    }
  }
} 