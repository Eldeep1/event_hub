import 'package:event_hub/domain/model/category_model.dart';

class CategoryResponse {
  final String id;
  final String name;

  CategoryResponse({required this.id, required this.name});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    String extractName(Map<String, dynamic> j) {
      // Ticketmaster classifications are nested. Prefer segment > genre > subGenre > type
      final segment = j['segment'] as Map<String, dynamic>?;
      if (segment != null && (segment['name'] as String?)?.isNotEmpty == true) {
        return segment['name'] as String;
      }
      final genre = j['genre'] as Map<String, dynamic>?;
      if (genre != null && (genre['name'] as String?)?.isNotEmpty == true) {
        return genre['name'] as String;
      }
      final sub = j['subGenre'] as Map<String, dynamic>?;
      if (sub != null && (sub['name'] as String?)?.isNotEmpty == true) {
        return sub['name'] as String;
      }
      final type = j['type'] as Map<String, dynamic>?;
      if (type != null && (type['name'] as String?)?.isNotEmpty == true) {
        return type['name'] as String;
      }

      return j['name'] as String? ?? '';
    }

    return CategoryResponse(
      id: json['id'] as String? ?? '',
      name: extractName(json),
    );
  }

  CategoryModel toDomain() => CategoryModel(id: id, name: name);
}
