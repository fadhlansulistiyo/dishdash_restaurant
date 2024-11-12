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

  Future<void> saveRestaurant(FavoriteRestaurant value) async {
    try {
      final result = await _service.insertItem(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
      } else {
        _message = "Your data is saved";
      }
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
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

  Future<void> loadRestaurantById(String id) async {
    try {
      _restaurant = await _service.getItemById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  Future<void> removeRestaurantById(String id) async {
    try {
      await _service.removeItem(id);

      _message = "Your data is removed";
      notifyListeners();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }

  bool checkItemFavorite(String id) {
    final isSameRestaurant = _restaurant!.id == id;
    return isSameRestaurant;
  }
}
