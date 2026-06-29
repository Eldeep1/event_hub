import 'package:event_hub/domain/model/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>> getEvents({
    DateTime? startDateTime,
    DateTime? endDateTime,
    bool sortAsc = true,
  });
  Future<EventModel> getEventById(String id);
}
