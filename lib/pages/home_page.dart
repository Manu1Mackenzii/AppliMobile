import 'package:flutter/material.dart';
import '../components/BottomNavBar.dart';
import '../components/side_menu.dart';
import '../models/concert.dart';
import '../services/concert_service.dart';
import '../components/concert_card.dart';

class HomePage extends StatefulWidget {
  bool isSideBarClosed = true;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Concert>> concerts;

  @override
  void initState() {
    super.initState();
    concerts = ConcertService().fetchConcerts(); // Appel au service pour récupérer les concerts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Free-Music')),
      body: FutureBuilder<List<Concert>>(
        future: concerts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Affiche un indicateur de chargement
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Si une erreur survient
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No concerts available.')); // Si aucun concert n'est disponible
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ConcertCard(concert: snapshot.data![index]); // Affiche les concerts dans une liste
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(), // Ajoute une barre de navigation en bas si nécessaire
    );
  }
}
