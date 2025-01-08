import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({
    required this.categoryId,
    required this.name,
    required this.icon,
  });

  // Crée une catégorie à partir d'une carte (données de la DB)
  factory  Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryId: map['category_id'],
      name: map['name'],
      icon: IconData(
        int.parse(map['icon']), // Stockez l'icône comme un entier (code Unicode)
        fontFamily: 'MaterialIcons',
      ),
    );
  }

  // Convertit une catégorie en carte (pour insertion dans la DB)
  Map<String, dynamic> toMap() {
    return {
      'category_id': categoryId,
      'name': name,
      'icon': icon.codePoint.toString(),
    };
  }
}
