class Concert {
  final String id;
  final String name;
  final String location;
  final DateTime date;
  final String artist;
  final int availableSeats;
  final bool isSoldOut;

  Concert({
    required this.id,
    required this.name,
    required this.location,
    required this.date,
    required this.artist,
    required this.availableSeats,
    this.isSoldOut = false,
  });
}
