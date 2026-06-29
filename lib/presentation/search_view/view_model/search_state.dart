import 'package:event_hub/domain/model/search_event_model.dart';

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
