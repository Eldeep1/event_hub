import 'package:event_hub/domain/model/event_model.dart';

class EventsResponse {
  final List<EventResponse> events;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;

  EventsResponse({
    required this.events,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  factory EventsResponse.fromJson(Map<String, dynamic> json) {
    final embedded = json['_embedded'] as Map<String, dynamic>?;
    final rawEvents = embedded?['events'] as List<dynamic>? ?? [];
    final events = rawEvents
        .whereType<Map<String, dynamic>>()
        .map(EventResponse.fromJson)
        .toList();

    final pageJson = json['page'] as Map<String, dynamic>? ?? {};

    return EventsResponse(
      events: events,
      page: pageJson['number'] as int? ?? 0,
      size: pageJson['size'] as int? ?? events.length,
      totalElements: pageJson['totalElements'] as int? ?? events.length,
      totalPages: pageJson['totalPages'] as int? ?? 1,
    );
  }
}

class EventResponse {
  final String id;
  final String name;
  final String description;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final double price;
  final String organizerName;
  final String url;

  EventResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.organizerName,
    required this.url,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    final dates = json['dates'] as Map<String, dynamic>?;
    final start = dates?['start'] as Map<String, dynamic>?;
    final localDate = start?['localDate'] as String? ?? '';
    final localTime = start?['localTime'] as String? ?? '';

    final embedded = json['_embedded'] as Map<String, dynamic>?;
    final venue = _extractVenue(embedded);
    final city = _extractCity(embedded);
    final location = _combineLocation(venue, city);
    final imageUrl = _extractImage(json['images'] as List<dynamic>?);
    final price = _extractPrice(json['priceRanges'] as List<dynamic>?);
    final organizerName = _extractOrganizerName(embedded);

    return EventResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: _extractDescription(json),
      date: localDate,
      time: localTime,
      location: location,
      imageUrl: imageUrl,
      price: price,
      organizerName: organizerName,
      url: json['url'] as String? ?? '',
    );
  }

  EventModel toDomain() {
    return EventModel(
      id: id,
      title: name,
      description: description,
      date: date,
      time: time,
      location: location,
      imageUrl: imageUrl,
      price: price,
      organizerName: organizerName,
    );
  }

  static String _extractDescription(Map<String, dynamic> json) {
    // Ticketmaster may provide description under different keys.
    final candidates = [
      json['info'],
      json['pleaseNote'],
      json['description'],
      json['details'],
      json['shortDescription'],
      json['blurb'],
    ];

    for (final c in candidates) {
      if (c is String && c.trim().isNotEmpty) return c.trim();
    }
    return '';
  }

  static String _combineLocation(String venue, String city) {
    if (venue.isEmpty && city.isEmpty) return '';
    if (venue.isEmpty) return city;
    if (city.isEmpty) return venue;
    return '$venue, $city';
  }

  static String _extractVenue(Map<String, dynamic>? embedded) {
    final venues = embedded?['venues'] as List<dynamic>?;
    if (venues == null || venues.isEmpty) return '';
    final venue = venues.firstWhere(
      (item) => item is Map<String, dynamic> && item['name'] != null,
      orElse: () => null,
    );
    if (venue is Map<String, dynamic>) {
      return venue['name'] as String? ?? '';
    }
    return '';
  }

  static String _extractCity(Map<String, dynamic>? embedded) {
    final venues = embedded?['venues'] as List<dynamic>?;
    if (venues == null || venues.isEmpty) return '';
    final venue = venues.firstWhere(
      (item) => item is Map<String, dynamic> && item['_embedded'] == null,
      orElse: () => venues.first,
    );
    if (venue is Map<String, dynamic>) {
      final city = venue['city'] as Map<String, dynamic>?;
      return city?['name'] as String? ?? '';
    }
    return '';
  }

  static String _extractImage(List<dynamic>? images) {
    if (images == null || images.isEmpty) return '';
    for (final raw in images) {
      if (raw is Map<String, dynamic>) {
        final url = raw['url'] as String?;
        if (url != null && url.isNotEmpty) {
          return url;
        }
      }
    }
    return '';
  }

  static double _extractPrice(List<dynamic>? ranges) {
    if (ranges == null || ranges.isEmpty) return 0.0;
    final first = ranges.firstWhere(
      (item) => item is Map<String, dynamic> && item['min'] != null,
      orElse: () => null,
    );
    if (first is Map<String, dynamic>) {
      final min = first['min'] as num?;
      return min?.toDouble() ?? 0.0;
    }
    return 0.0;
  }

  static String _extractOrganizerName(Map<String, dynamic>? embedded) {
    final promoters = embedded?['promoters'] as List<dynamic>?;
    if (promoters != null && promoters.isNotEmpty) {
      final promoter = promoters.firstWhere(
        (item) => item is Map<String, dynamic> && item['name'] != null,
        orElse: () => null,
      );
      if (promoter is Map<String, dynamic>) {
        return promoter['name'] as String? ?? '';
      }
    }
    return '';
  }
}
