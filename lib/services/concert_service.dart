import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/concert.dart';

class ConcertService {
  static const String apiUrl =   'http://127.0.0.1:3003/api/concerts';

  Future<List<Concert>> fetchConcerts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((concert) => Concert(
        id: concert['id'],
        name: concert['name'],
        location: concert['location'],
        date: DateTime.parse(concert['date']),
        artist: concert['artist'],
        availableSeats: concert['availableSeats'],
        isSoldOut: concert['isSoldOut'],
      )).toList();
    } else {
      throw Exception('Failed to load concerts');
    }
  }
}
