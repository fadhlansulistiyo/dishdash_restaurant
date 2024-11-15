import 'package:dishdash_restaurant/data/local/restaurant_database_service.dart';
import 'package:flutter/material.dart';
import '../../data/model/favorite_restaurant.dart';

class RestaurantDatabaseProvider extends ChangeNotifier {
  final RestaurantDatabaseService _service;

  RestaurantDatabaseProvider(this._service);

  String _message = "";
  String get message => _message;

  List<FavoriteRestaurant>? _restaurantList;
  List<FavoriteRestaurant>? get restaurantList => _restaurantList;

  FavoriteRestaurant? _restaurant;
  FavoriteRestaurant? get restaurant => _restaurant;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  Future<void> saveRestaurant(FavoriteRestaurant value) async {
    try {
      final result = await _service.insertItem(value);
      if (result != 0) {
        _message = "Your data is saved";
        _isFavorite = true;
      } else {
        _message = "Failed to save your data";
      }
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
  }

  Future<void> removeRestaurantById(String id) async {
    try {
      await _service.removeItem(id);
      _isFavorite = false;
      _message = "Your data is removed";
    } catch (e) {
      _message = "Failed to remove your data";
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(FavoriteRestaurant restaurant) async {
    if (_isFavorite) {
      await removeRestaurantById(restaurant.id);
    } else {
      await saveRestaurant(restaurant);
    }
  }

  Future<void> loadRestaurantById(String id) async {
    try {
      _restaurant = await _service.getItemById(id);
      _isFavorite = _restaurant != null && _restaurant!.id == id;
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      _isFavorite = false;
      notifyListeners();
    }
  }

  Future<void> loadAllRestaurant() async {
    try {
      _restaurantList = await _service.getAllItems();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }
}
