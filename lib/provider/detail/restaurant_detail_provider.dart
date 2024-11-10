import 'package:flutter/material.dart';
import '../../data/api/api_service.dart';
import '../../data/model/restaurant_detail.dart';
import '../../static/restaurant_detail_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantDetailProvider({required this.apiService});

  late RestaurantDetail _restaurantDetail;
  RestaurantDetail get restaurantDetail => _restaurantDetail;

  RestaurantDetailResultState _restaurantDetailState = RestaurantDetailNoneState();
  RestaurantDetailResultState get restaurantDetailState => _restaurantDetailState;

  String _message = '';
  String get message => _message;

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      _restaurantDetailState = RestaurantDetailLoadingState();
      notifyListeners();

      final result = await apiService.getRestaurantDetail(id);
      if (result.error) {
        _restaurantDetailState = RestaurantDetailErrorState(result.message);
      } else {
        _restaurantDetailState = RestaurantDetailLoadedState(result.restaurant);
      }
    } on Exception catch (e) {
      _restaurantDetailState = RestaurantDetailErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> submitReview(String id, String name, String review) async {
    try {
      await apiService.addReview(id, name, review);

      _message = 'Review added successfully';

      await fetchRestaurantDetail(id);

      notifyListeners();
    } on Exception catch (e) {
      _message = 'Error: $e';
    } finally {
      notifyListeners();
    }
  }
}
