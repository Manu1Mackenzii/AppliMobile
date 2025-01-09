class Event {
  final int eventId;
  final String imagePath, title, description, location, duration, punchLine1,
      punchLine2;
  final List<int> categoryIds;
  final List<String> galleryImages;

  Event({
    required this.eventId,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.duration,
    required this.punchLine1,
    required this.punchLine2,
    required this.categoryIds,
    required this.galleryImages,
  });


  // Crée un objet Event à partir d'une carte (données de la DB)
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      eventId: map['event_id'],
      imagePath: map['image_path'],
      title: map['title'],
      description: map['description'],
      location: map['location'],
      duration: map['duration'],
      punchLine1: map['punch_line_1'],
      punchLine2: map['punch_line_2'],
      categoryIds: (map['category_ids'] as String).split(',')
          .map(int.parse)
          .toList(),
      galleryImages: (map['gallery_images'] as String).split(','),
    );
  }

  // Convertit un Event en carte (pour insertion dans la DB)
  Map<String, dynamic> toMap() {
    return {
      'event_id': eventId,
      'image_path': imagePath,
      'title': title,
      'description': description,
      'location': location,
      'duration': duration,
      'punch_line_1': punchLine1,
      'punch_line_2': punchLine2,
      'category_ids': categoryIds.join(','),
      // Stockage en tant que chaîne CSV
      'gallery_images': galleryImages.join(','),
      // Stockage en tant que chaîne CSV
    };
  }

  // Méthode pour convertir un objet Event en JSON
  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'title': title,
      'categoryIds': categoryIds,
    };
  }


  factory Event.fromJson(Map<String, dynamic> json) {

    return Event(
      eventId: json['eventId'],
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      duration: json['duration'],
      punchLine1: json['punchLine1'],
      punchLine2: json['punchLine2'],
      categoryIds: List<int>.from(json['categoryIds']),
      galleryImages: List<String>.from(json['galleryImages']),
    );
  }

}