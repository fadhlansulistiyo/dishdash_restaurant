import 'dart:io';
import 'package:dishdash_restaurant/data/model/restaurant_detail.dart';
import 'package:dishdash_restaurant/data/model/restaurant_result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/restaurant_review.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _list = 'list';
  static const String _search = 'search?q=';
  static const String _detail = 'detail/';
  static const String _review = 'review';

  T _processResponse<T>(
      http.Response response, T Function(Map<String, dynamic>) fromJson) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw const HttpException('Data not found (404)');
    } else if (response.statusCode >= 500) {
      throw const HttpException('Server error (5xx)');
    } else {
      throw HttpException('Failed with status code ${response.statusCode}');
    }
  }

  Future<RestaurantResult> getListRestaurant() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl$_list"));
      return _processResponse(
          response, (json) => RestaurantResult.fromJson(json));
    } on SocketException {
      throw Exception('No internet connection');
    } on FormatException {
      throw Exception('Invalid data format');
    } on HttpException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<RestaurantResult> searchRestaurant(String query) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl$_search$query"));
      return _processResponse(
          response, (json) => RestaurantResult.fromJson(json));
    } on SocketException {
      throw Exception('No internet connection');
    } on FormatException {
      throw Exception('Invalid data format');
    } on HttpException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<RestaurantDetailResult> getRestaurantDetail(String id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl$_detail$id"));
      return _processResponse(
          response, (json) => RestaurantDetailResult.fromJson(json));
    } on SocketException {
      throw Exception('No internet connection');
    } on FormatException {
      throw Exception('Invalid data format');
    } on HttpException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Review> addReview(String id, String name, String review) async {
    try {
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

      return _processResponse(response, (json) => Review.fromJson(json));
    } on SocketException {
      throw Exception('No internet connection');
    } on FormatException {
      throw Exception('Invalid data format');
    } on HttpException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
