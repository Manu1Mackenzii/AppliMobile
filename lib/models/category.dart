import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final String iconCode;

  Category({
    required this.categoryId,
    required this.name,
    required this.iconCode,
  });

  // Convertir la catégorie en JSON
  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'iconCode': iconCode,
    };
  }

  // Créer une catégorie à partir de JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      name: json['name'],
      iconCode: json['iconCode'],
    );
  }

  IconData getIconData() {
    switch (iconCode) {
      case 'music_note':
        return Icons.music_note;
      case 'headset':
        return Icons.headset;
      case 'album':
        return Icons.album;
      case 'mic':
        return Icons.mic;
      case 'movie_creation':
        return Icons.movie_creation;
      case 'music_off':
        return Icons.music_off;
      case 'music_video':
        return Icons.music_video;
      case 'keyboard':
        return Icons.keyboard;
      case 'batterie':
        return Icons.battery_charging_full;
      default:
        return Icons.help;
    }
  }
}
