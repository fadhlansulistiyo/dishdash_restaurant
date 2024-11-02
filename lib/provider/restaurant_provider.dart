import 'package:dishdash_restaurant/data/api/restaurant_result.dart';
import 'package:dishdash_restaurant/provider/result_state.dart';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import 'dart:io';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _getAllRestaurant();
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantResult get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> _getAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurant = await apiService.getListRestaurant();

      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        _restaurantResult = restaurant;
      }
    } on SocketException {
      _state = ResultState.error;
      _message = 'No Internet Connection';
    } catch (e) {
      _state = ResultState.error;
      _message = 'Failed to display data';
    } finally {
      notifyListeners();
    }
  }
}
