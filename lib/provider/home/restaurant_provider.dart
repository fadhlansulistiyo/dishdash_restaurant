import 'package:dishdash_restaurant/data/model/restaurant_result.dart';
import 'package:dishdash_restaurant/static/restaurant_result_state.dart';
import 'package:flutter/material.dart';
import '../../data/api/api_service.dart';
import 'package:http/http.dart' as http;

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService});

  late RestaurantResult _restaurantResult;
  RestaurantResult get result => _restaurantResult;

  String _query = '';
  String get query => _query;

  RestaurantListResultState _restaurantResultState = RestaurantListNoneState();
  RestaurantListResultState get restaurantResultState => _restaurantResultState;

  Future<void> fetchAllRestaurants() async {
    try {
      _restaurantResultState = RestaurantListLoadingState();
      notifyListeners();

      final restaurant = await apiService.getListRestaurant();

      if (restaurant.error) {
        _restaurantResultState =
            RestaurantListErrorState(restaurant.message ?? "Error");
      } else {
        _restaurantResultState =
            RestaurantListLoadedState(restaurant.restaurants);
      }
    } on Exception catch (e) {
      _restaurantResultState = RestaurantListErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> searchRestaurants(String query) async {
    _query = query;
    if (query.isEmpty) {
      fetchAllRestaurants();
      return;
    }

    try {
      _restaurantResultState = RestaurantListLoadingState();
      notifyListeners();

      final result = await apiService.searchRestaurant(query);
      if (result.restaurants.isEmpty) {
        _restaurantResultState =
            RestaurantListErrorState('No search results found');
      } else {
        _restaurantResultState = RestaurantListLoadedState(result.restaurants);
      }
    } on Exception catch (e) {
      _restaurantResultState = RestaurantListErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
