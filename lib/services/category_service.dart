// lib/services/category_service.dart
import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/category.dart';
import 'auth.service.dart';

class CategoryService {
  final Dio _dio;
  final String apiUrl = 'http://127.0.0.1:3003/api';
  final AuthService _authService;

  CategoryService({
    Dio? dio,
    AuthService? authService,
  })
      : _dio = dio ?? Dio(),
        _authService = authService ?? AuthService();

  // Méthode pour récupérer toutes les catégories
  Future<List<Category>> fetchCategories() async {
    try {
      final accessToken = await _authService.getToken();
      final response = await _dio.get(
        '$apiUrl/categories',  // Utilisation de l'URL stockée dans apiUrl
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        // Utilisation de response.data directement
        List<dynamic> jsonData = response.data as List<dynamic>; // Changer 'response.body' en 'response.data'
        return jsonData.map((json) {
          // Mapper l'icône à un code d'icône approprié
          String iconCode = json['icon'];
          if (iconCode == '(🎵)') {
            iconCode = 'music_note';
          } else if (iconCode == '(🎧)') {
            iconCode = 'headset';
          }

          else if(iconCode == '(🎤)'){
            iconCode = 'mic';
          }
          else if(iconCode == '(🎥)'){
            iconCode = 'movie_creation';
          }
          else if(iconCode == '(🎻)'){
            iconCode = 'music_off';
          }
          else if(iconCode == '(🎸)'){
            iconCode = 'music_video';
          }
          else if(iconCode == '(🎹)'){
            iconCode = 'keyboard';
          }
          else if(iconCode == '(🎺)'){
            iconCode = 'trumpets';
          }
          else if(iconCode == '(🎷)'){
            iconCode = 'saxophone';
          }
          else if(iconCode == '(🥁)'){
            iconCode = 'batterie';
          }

          else if(iconCode == '(🎵)'){
            iconCode = 'music_note';
          }


          return Category.fromJson({
            ...json,
            'iconCode': iconCode, // Remplacer l'emoji par le code d'icône
          });
        }).toList();
      } else {
        throw Exception('Échec de la récupération des catégories');
      }
    } catch (e) {
      print('Erreur lors de la récupération des catégories: $e');
      throw Exception('Échec de la récupération des catégories');
    }
  }
}
