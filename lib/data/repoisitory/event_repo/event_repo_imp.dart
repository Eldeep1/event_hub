import 'package:event_hub/data/data_source/remote/event_remote_data_source.dart';
import 'package:event_hub/domain/model/event_model.dart';
import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:event_hub/domain/model/category_model.dart';

class EventRepoImp extends EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepoImp({required this.remoteDataSource});

  @override
  Future<List<EventModel>> getEvents({
    String? keyword,
    DateTime? startDateTime,
    DateTime? endDateTime,
    bool sortAsc = true,
  }) async {
    final eventResponses = await remoteDataSource.getEvents(
      keyword: keyword,
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

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categoryResponses = await remoteDataSource.getCategories();
    return categoryResponses.map((c) => c.toDomain()).toList();
  }
}
