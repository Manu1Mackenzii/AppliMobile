import 'package:flutter/material.dart';
import '../models/concert.dart';

class ConcertDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final concert = ModalRoute.of(context)!.settings.arguments as Concert;

    return Scaffold(
      appBar: AppBar(title: Text(concert.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(concert.artist, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(concert.location),
            SizedBox(height: 8),
            Text('Date: ${concert.date.toLocal()}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: concert.isSoldOut ? null : () {},
              child: Text(concert.isSoldOut ? 'Sold Out' : 'Reserve Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
