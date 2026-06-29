class NetworkConstants {
  static const String baseUrl = 'https://app.ticketmaster.com/discovery/v2';
  static const String apiKey = 'XAummFIJjD8LHuiHxWUNThRYr9J8WtGs';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const String eventsPath = '/events.json';
  static const String classificationsPath = '/classifications.json';

  static Map<String, dynamic> eventsQueryParameters({
    String? keyword,
    int page = 0,
    DateTime? startDateTime,
    DateTime? endDateTime,
    bool sortAsc = true,
  }) {
    final params = <String, dynamic>{
      'apikey': apiKey,
      'page': page.toString(),
      'sort': sortAsc ? 'date,asc' : 'date,desc',
    };
    if (keyword != null && keyword.isNotEmpty) {
      params['keyword'] = keyword;
    }
    if (startDateTime != null) {
      params['startDateTime'] = _formatIsoUtc(startDateTime);
    }
    if (endDateTime != null) {
      params['endDateTime'] = _formatIsoUtc(endDateTime);
    }
    return params;
  }

  static String _formatIsoUtc(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String().split('.').first + 'Z';
  }

  static String eventDetailsPath(String id) => '/events/$id.json';
}
