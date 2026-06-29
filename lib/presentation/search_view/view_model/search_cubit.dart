import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:event_hub/domain/model/search_event_model.dart';
import 'package:event_hub/presentation/search_view/view_model/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final EventRepository repo;

  SearchCubit({required this.repo}) : super(SearchState());

  Future<void> onSearchChanged(String query) async {
    emit(state.copyWith(searchQuery: query, isLoading: true));

    if (query.trim().isEmpty) {
      emit(
        state.copyWith(
          searchQuery: query,
          filteredEvents: [],
          isLoading: false,
        ),
      );
      return;
    }

    try {
      final events = await repo.getEvents(keyword: query);
      final mapped = events
          .map(
            (e) => SearchEventModel(
              id: e.title,
              title: e.title,
              date: e.date,
              imageUrl: e.imageUrl,
            ),
          )
          .toList();
      emit(state.copyWith(filteredEvents: mapped, isLoading: false));
    } catch (_) {
      emit(state.copyWith(filteredEvents: [], isLoading: false));
    }
  }
}
