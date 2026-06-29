import 'package:event_hub/data/data_source/remote/event_remote_data_source.dart';
import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/domain/repository/event_repo.dart';

class EventRepoImp extends EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepoImp({required this.remoteDataSource});

  @override
  Future<List<EventModel>> getEvents({
    DateTime? startDateTime,
    DateTime? endDateTime,
    bool sortAsc = true,
  }) async {
    final eventResponses = await remoteDataSource.getEvents(
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      sortAsc: sortAsc,
    );
    return eventResponses.map((response) => response.toDomain()).toList();
  }

  @override
  Future<EventModel> getEventById(String id) async {
    final eventResponse = await remoteDataSource.getEventById(id);
    return eventResponse.toDomain();
  }
}
