import 'package:dishdash_restaurant/data/api/restaurant_detail.dart';
import 'package:dishdash_restaurant/data/api/restaurant_result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _list = 'list';
  static const String _search = 'search?q=';
  static const String _detail = 'detail/';
  static const String _review = 'review';

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

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl$_detail$id"));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(
          json.decode(response.body)["restaurant"]);
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<void> addReview(String id, String name, String review) async {
    final response = await http.post(
      Uri.parse("$_baseUrl$_review"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "id": id,
        "name": name,
        "review": review,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add review');
    }
  }
}
