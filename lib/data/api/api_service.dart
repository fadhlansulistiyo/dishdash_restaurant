import 'dart:io';

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

  RestaurantResult _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw HttpException('Failed with status code ${response.statusCode}');
    }
  }

  Future<RestaurantResult> getListRestaurant() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl$_list"));
      return _processResponse(response);
    } on SocketException {
      throw Exception('No internet connection');
    } on HttpException {
      throw Exception('Failed to load data');
    } on FormatException {
      throw Exception('Invalid data format');
    } catch (e) {
      throw Exception('Unexpected error: $e');
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
