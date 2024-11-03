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
  ResultState _reviewSubmitState = ResultState.idle;
  String _message = '';

  String get message => _message;
  RestaurantDetail get restaurantDetail => _restaurantDetail;
  ResultState get state => _state;
  ResultState get reviewSubmitState => _reviewSubmitState;

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final detail = await apiService.getRestaurantDetail(id);
      _restaurantDetail = detail;
      _state = ResultState.hasData;
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

  Future<void> submitReview(String id, String name, String review) async {
    try {
      _reviewSubmitState = ResultState.loading;
      notifyListeners();

      await apiService.addReview(id, name, review);

      _reviewSubmitState = ResultState.hasData;
      _message = 'Review added successfully';

      await fetchRestaurantDetail(id);

      notifyListeners();

    } on SocketException {
      _reviewSubmitState = ResultState.error;
      _message = 'No internet connection';
    } catch (e) {
      _reviewSubmitState = ResultState.error;
      _message = 'Failed to add review';
    } finally {
      notifyListeners();
    }
  }
}
