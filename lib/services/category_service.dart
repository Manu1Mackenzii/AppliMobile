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
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    try {
      final accessToken = await _authService.getToken();
      final response = await _dio.get(
        '$apiUrl/categories',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception(
            'Échec de la récupération des catégories: ${response.data}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des catégories: $e');
      throw Exception('Échec de la récupération des catégories');
    }
  }
}
