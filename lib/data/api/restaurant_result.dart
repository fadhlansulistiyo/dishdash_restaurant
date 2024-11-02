// To parse this JSON data, do
//
//     final restaurantResult = restaurantResultFromJson(jsonString);

import 'dart:convert';

RestaurantResult restaurantResultFromJson(String str) =>
    RestaurantResult.fromJson(json.decode(str));

String restaurantResultToJson(RestaurantResult data) =>
    json.encode(data.toJson());

class RestaurantResult {
  bool error;
  String? message;
  int count;
  List<Restaurant> restaurants;

  RestaurantResult({
    required this.error,
    this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    error: json["error"] as bool,
    message: json["message"] as String? ?? 'No message',
    count: json["count"] as int? ?? 0,
    restaurants: (json["restaurants"] as List<dynamic>?)
        ?.map((x) => Restaurant.fromJson(x as Map<String, dynamic>))
        .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": restaurants.map((x) => x.toJson()).toList(),
  };
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"] as String? ?? '',
    name: json["name"] as String? ?? '',
    description: json["description"] as String? ?? '',
    pictureId: json["pictureId"] as String? ?? '',
    city: json["city"] as String? ?? '',
    rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}
