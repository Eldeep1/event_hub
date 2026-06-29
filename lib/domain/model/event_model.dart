class EventModel {
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final double price;
  final String organizerName;

  EventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.organizerName,
  });
}
