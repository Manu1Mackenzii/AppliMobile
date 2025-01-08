// lib/services/event_service.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/event.dart';
import 'auth.service.dart';

class EventService {
  final Dio _dio;
  final String apiUrl = 'http://127.0.0.1:3003/api';
  final AuthService _authService;

  EventService({
    Dio? dio,
    AuthService? authService,
  })
      : _dio = dio ?? Dio(),
        _authService = authService ?? AuthService();

  // Méthode pour récupérer tous les événements


  Future<List<Map<String, dynamic>>> fetchEvents() async {
    try {
      final accessToken = await _authService.getToken();
      final response = await _dio.get(
        '$apiUrl/matches',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception(
            'Échec de la récupération des matches: ${response.data}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des matches: $e');
      throw Exception('Échec de la récupération des matches');
    }
  }
}