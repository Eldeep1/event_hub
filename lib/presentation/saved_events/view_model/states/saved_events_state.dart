import 'package:event_hub/domain/model/event_model.dart';

class SavedEventsState {
  final bool isLoading;
  final bool isSaved;
  final List<EventModel> savedEvents;
  final String? messageKey;
  final String? errorMessage;

  const SavedEventsState({
    this.isLoading = false,
    this.isSaved = false,
    this.savedEvents = const [],
    this.messageKey,
    this.errorMessage,
  });

  SavedEventsState copyWith({
    bool? isLoading,
    bool? isSaved,
    List<EventModel>? savedEvents,
    String? messageKey,
    String? errorMessage,
  }) {
    return SavedEventsState(
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
      savedEvents: savedEvents ?? this.savedEvents,
      messageKey: messageKey,
      errorMessage: errorMessage,
    );
  }
}
