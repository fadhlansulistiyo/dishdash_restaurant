import 'package:dishdash_restaurant/data/api/restaurant_result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _list = 'list';
  static const String _search = 'search?q=';

  Future<RestaurantResult> getListRestaurant() async {
    final response = await http.get(Uri.parse("$_baseUrl$_list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list Restaurant');
    }
  }

  Future<RestaurantResult> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl$_search$query"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
