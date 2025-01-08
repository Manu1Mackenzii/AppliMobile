class Guest {
  final String imagePath;

  Guest(this.imagePath);

  // Crée un objet Guest à partir d'une carte (données DB)
  factory Guest.fromMap(Map<String, dynamic> map) {
    return Guest(map['image_path']);
  }

  // Convertit un Guest en carte pour l'insertion dans la DB
  Map<String, dynamic> toMap() {
    return {
      'image_path': imagePath,
    };
  }
}
