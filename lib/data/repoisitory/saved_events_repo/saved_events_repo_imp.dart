import 'package:event_hub/data/data_source/local/saved_events_local_data_source.dart';
import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/domain/repository/saved_events_repo.dart';

class SavedEventsRepoImp extends SavedEventsRepository {
  final SavedEventsLocalDataSource localDataSource;

  SavedEventsRepoImp({required this.localDataSource});

  @override
  Future<List<EventModel>> getSavedEvents() async {
    return await localDataSource.getSavedEvents();
  }

  @override
  Future<void> removeEvent(String eventId) async {
    await localDataSource.removeEvent(eventId);
  }

  @override
  Future<bool> isSaved(String eventId) async {
    return await localDataSource.isSaved(eventId);
  }

  @override
  Future<void> saveEvent(EventModel event) async {
    await localDataSource.saveEvent(event);
  }
}
