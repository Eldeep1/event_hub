import 'package:event_hub/domain/model/event_model.dart';

class SearchEventModel {
  final String id;
  final String title;
  final String date;
  final String imageUrl;
  final EventModel event;

  SearchEventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.event,
  });
}
