import 'package:event_hub/data/model/event_response.dart';
import 'package:event_hub/data/network/api_client.dart';
import 'package:event_hub/data/network/network_constants.dart';
import 'package:event_hub/data/network/network_errors.dart';

class EventRemoteDataSource {
  final ApiClient apiClient;

  EventRemoteDataSource({ApiClient? apiClient})
    : apiClient = apiClient ?? ApiClient();

  Future<List<EventResponse>> getEvents({String? keyword, int page = 0}) async {
    final response = await apiClient.get<Map<String, dynamic>>(
      NetworkConstants.eventsPath,
      queryParameters: NetworkConstants.eventsQueryParameters(
        keyword: keyword,
        page: page,
      ),
    );

    final responseData = response.data;
    if (responseData == null) {
      throw NetworkException('Empty response body from event list request');
    }

    return EventsResponse.fromJson(responseData).events;
  }

  Future<EventResponse> getEventById(String id) async {
    final response = await apiClient.get<Map<String, dynamic>>(
      NetworkConstants.eventDetailsPath(id),
      queryParameters: {'apikey': NetworkConstants.apiKey},
    );

    final responseData = response.data;
    if (responseData == null) {
      throw NetworkException('Empty response body from event detail request');
    }

    return EventResponse.fromJson(responseData);
  }
}
