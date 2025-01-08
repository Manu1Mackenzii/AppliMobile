import 'package:flutter/material.dart';
import '../models/concert.dart';

class ConcertCard extends StatelessWidget {
  final Concert concert;

  ConcertCard({required this.concert});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(concert.name),
        subtitle: Text('${concert.artist} - ${concert.location}'),
        trailing: Text('${concert.date.toLocal()}'),
        onTap: () {
          Navigator.pushNamed(context, '/concertDetail', arguments: concert);
        },
      ),
    );
  }
}
