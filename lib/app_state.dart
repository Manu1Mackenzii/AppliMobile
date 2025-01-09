import 'package:flutter/material.dart';
import '../services/event_service.dart';
import '../services/category_service.dart';
import '../models/event.dart';
import '../models/category.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryId = 0; // Catégorie sélectionnée
  List<Category> categories = [];
  List<Event> events = [];
  bool isLoadingCategories = true;
  bool isLoadingEvents = true;

  AppState() {
    _loadCategories();
    _loadEvents();
  }

  void updateCategoryId(int selectedCategoryId) {
    if (categories.any((category) => category.categoryId == selectedCategoryId)) {
      this.selectedCategoryId = selectedCategoryId;
      notifyListeners();
    } else {
      print('ID de catégorie non valide : $selectedCategoryId');
    }
  }

  Future<void> _loadCategories() async {
    isLoadingCategories = true;
    notifyListeners();
    try {
      final data = await CategoryService().fetchCategories();
      categories = data.cast<Category>();
    } catch (e) {
      print('Erreur lors du chargement des catégories: $e');
    } finally {
      isLoadingCategories = false;
      notifyListeners();
    }
  }

  Future<void> _loadEvents() async {
    isLoadingEvents = true;
    notifyListeners();
    try {
      final data = await EventService().fetchEvents();
      events = data.map((eventJson) => Event.fromJson(eventJson)).toList();
    } catch (e) {
      print('Erreur lors du chargement des événements: $e');
    } finally {
      isLoadingEvents = false;
      notifyListeners();
    }
  }

  List<Event> get filteredEvents {
    if (selectedCategoryId == 0) {
      return events;
    }
    return events.where((event) => event.categoryIds.contains(selectedCategoryId)).toList();
  }

  bool get isLoading => isLoadingCategories || isLoadingEvents;
}
