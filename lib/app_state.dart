import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freemusic/services/event_service.dart';
import 'package:freemusic/services/category_service.dart';

import 'models/event.dart';
class AppState extends ChangeNotifier {

  int selectedCategoryId = 0; // Catégorie sélectionnée
  List<Category> categories = [];
  List<Event> events = [];

  AppState() {
    _loadCategories();
    _loadEvents();
  }

  // Mise à jour de l'ID de la catégorie sélectionnée
  void updateCategoryId(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }

  // Charger les catégories depuis le service
  Future<void> _loadCategories() async {
    categories = (await CategoryService().fetchCategories()).cast<Category>();
    notifyListeners(); // Met à jour les widgets qui écoutent ce changement
  }

  // Charger les événements depuis le service
  Future<void> _loadEvents() async {
    events = (await EventService().fetchEvents()).cast<Event>();
    notifyListeners(); // Met à jour les widgets qui écoutent ce changement
  }

  // Récupérer les événements filtrés par catégorie
  List<Event> get filteredEvents {
    return events.where((event) => event.categoryIds.contains(selectedCategoryId)).toList();
  }
}

