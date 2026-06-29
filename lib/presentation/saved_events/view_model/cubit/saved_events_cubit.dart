import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/domain/repository/saved_events_repo.dart';
import 'package:event_hub/presentation/saved_events/view_model/states/saved_events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedEventsCubit extends Cubit<SavedEventsState> {
  final SavedEventsRepository savedEventsRepository;

  SavedEventsCubit({required this.savedEventsRepository})
    : super(const SavedEventsState());

  Future<void> loadSavedEvents() async {
    emit(state.copyWith(isLoading: true, messageKey: null, errorMessage: null));
    try {
      final events = await savedEventsRepository.getSavedEvents();
      emit(state.copyWith(isLoading: false, savedEvents: events));
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  Future<void> loadSavedStatus(String eventId) async {
    final isSaved = await savedEventsRepository.isSaved(eventId);
    emit(state.copyWith(isSaved: isSaved, messageKey: null));
  }

  Future<void> toggleSavedEvent(EventModel event) async {
    final alreadySaved = await savedEventsRepository.isSaved(event.id);
    if (alreadySaved) {
      await savedEventsRepository.removeEvent(event.id);
      final events = await savedEventsRepository.getSavedEvents();
      emit(
        state.copyWith(
          isSaved: false,
          savedEvents: events,
          messageKey: 'removed_saved_event',
        ),
      );
      return;
    }

    await savedEventsRepository.saveEvent(event);
    final events = await savedEventsRepository.getSavedEvents();
    emit(
      state.copyWith(
        isSaved: true,
        savedEvents: events,
        messageKey: 'added_saved_event',
      ),
    );
  }
}
