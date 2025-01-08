import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freemusic/services/auth.service.dart';

import 'package:easy_localization/easy_localization.dart'; // Import easy_localization

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final AuthService _authService = AuthService();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

  }




  // Fonction pour afficher un dialogue permettant à l'utilisateur de changer de langue
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('choose_language'.tr()),  // Utilisation de easy_localization pour traduire le titre
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  context.setLocale(Locale('en', 'US'));  // Changer la langue en anglais
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Français'),
                onTap: () {
                  context.setLocale(Locale('fr', 'FR'));  // Changer la langue en français
                  Navigator.pop(context);
                },
              ),
              // Ajouter d'autres langues ici si nécessaire
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          tr('team_up'),  // Utilisation de easy_localization pour traduire le titre de l'app
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF01BF6B),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () => _showLanguageDialog(context),  // Afficher le dialogue pour changer la langue
        child: const Icon(Icons.language),
        backgroundColor: Colors.green,
        tooltip: tr('change_language'),  // Utilisation de easy_localization pour le tooltip
      ),
    );
  }
}
