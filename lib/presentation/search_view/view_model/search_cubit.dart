import 'package:flutter_bloc/flutter_bloc.dart';

// --- Event Model (Mock) ---
class SearchEventModel {
  final String id;
  final String title;
  final String date;
  final String imageUrl;

  SearchEventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.imageUrl,
  });
}

// --- Search State ---
class SearchState {
  final String searchQuery;
  final List<SearchEventModel> filteredEvents;
  final bool isLoading;

  SearchState({
    this.searchQuery = '',
    this.filteredEvents = const [],
    this.isLoading = false,
  });

  SearchState copyWith({
    String? searchQuery,
    List<SearchEventModel>? filteredEvents,
    bool? isLoading,
  }) {
    return SearchState(
      searchQuery: searchQuery ?? this.searchQuery,
      filteredEvents: filteredEvents ?? this.filteredEvents,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// --- Search Cubit ---
class SearchCubit extends Cubit<SearchState> {
  // Mock Database
  final List<SearchEventModel> _allEvents = [
    SearchEventModel(
      id: '1',
      title: 'A virtual evening of smooth jazz',
      date: '1ST MAY- SAT -2:00 PM',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    SearchEventModel(
      id: '2',
      title: 'Jo malone london’s mother’s day',
      date: '1ST MAY- SAT -2:00 PM',
      imageUrl: 'https://i.pravatar.cc/150?img=12',
    ),
    SearchEventModel(
      id: '3',
      title: 'Women\'s leadership conference',
      date: '1ST MAY- SAT -2:00 PM',
      imageUrl: 'https://i.pravatar.cc/150?img=13',
    ),
    SearchEventModel(
      id: '4',
      title: 'International kids safe parents night out',
      date: '1ST MAY- SAT -2:00 PM',
      imageUrl: 'https://i.pravatar.cc/150?img=14',
    ),
    SearchEventModel(
      id: '5',
      title: 'International gala music festival',
      date: '1ST MAY- SAT -2:00 PM',
      imageUrl: 'https://i.pravatar.cc/150?img=15',
    ),
  ];

  SearchCubit() : super(SearchState()) {
    // Initially show all events
    emit(state.copyWith(filteredEvents: _allEvents));
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(searchQuery: query, filteredEvents: _allEvents));
      return;
    }

    final lowerCaseQuery = query.toLowerCase();
    final filtered = _allEvents.where((event) {
      return event.title.toLowerCase().contains(lowerCaseQuery);
    }).toList();

    emit(state.copyWith(searchQuery: query, filteredEvents: filtered));
  }
}