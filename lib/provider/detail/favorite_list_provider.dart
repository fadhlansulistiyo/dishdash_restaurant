import 'package:flutter/material.dart';
import '../../data/model/restaurant_detail.dart';

class FavoriteListProvider extends ChangeNotifier {
  final List<RestaurantDetail> _favoriteList = [];

  List<RestaurantDetail> get favoriteList => _favoriteList;

  void addFavorite(RestaurantDetail value) {
    _favoriteList.add(value);
    notifyListeners();
  }

  void removeFavorite(RestaurantDetail value) {
    _favoriteList.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  bool checkItemFavorite(RestaurantDetail value) {
    final restaurantInList =
        _favoriteList.where((element) => element.id == value.id);
    return restaurantInList.isNotEmpty;
  }
}
