import 'package:dishdash_restaurant/data/api/restaurant_result.dart';
import 'package:dishdash_restaurant/provider/result_state.dart';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import 'dart:io';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    fetchAllRestaurants();
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;
  String _message = '';
  String _query = '';

  String get message => _message;
  RestaurantResult get result => _restaurantResult;
  ResultState get state => _state;
  String get query => _query;

  Future<void> fetchAllRestaurants() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurant = await apiService.getListRestaurant();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        _message = 'No data available';
      } else {
        _state = ResultState.hasData;
        _restaurantResult = restaurant;
      }
    } on SocketException {
      _state = ResultState.error;
      _message = 'No internet connection';
    } catch (e) {
      _state = ResultState.error;
      _message = 'Failed to load data';
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
      _state = ResultState.loading;
      notifyListeners();

      final result = await apiService.searchRestaurant(query);
      if (result.restaurants.isEmpty) {
        _state = ResultState.noData;
        _message = 'No search results found';
      } else {
        _state = ResultState.hasData;
        _restaurantResult = result;
      }
    } on SocketException {
      _state = ResultState.error;
      _message = 'No internet connection';
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error --> $e';
    } finally {
      notifyListeners();
    }
  }
}
