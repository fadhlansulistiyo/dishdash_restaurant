import 'dart:io';
import 'package:dishdash_restaurant/provider/result_state.dart';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/api/restaurant_detail.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantDetailProvider({required this.apiService});

  late RestaurantDetail _restaurantDetail;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  RestaurantDetail get restaurantDetail => _restaurantDetail;
  ResultState get state => _state;

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final detail = await apiService.getRestaurantDetail(id);
      _state = ResultState.hasData;
      _restaurantDetail = detail;
    } on SocketException {
      _state = ResultState.error;
      _message = 'No internet connection';
    } catch (e) {
      _state = ResultState.error;
      _message = 'Failed to load restaurant detail';
    } finally {
      notifyListeners();
    }
  }
}
