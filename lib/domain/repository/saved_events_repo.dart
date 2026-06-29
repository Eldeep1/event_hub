import 'package:event_hub/domain/model/event_model.dart';

abstract class SavedEventsRepository {
  Future<List<EventModel>> getSavedEvents();
  Future<void> saveEvent(EventModel event);
  Future<void> removeEvent(String eventId);
  Future<bool> isSaved(String eventId);
}
