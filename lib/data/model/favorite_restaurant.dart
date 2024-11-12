class FavoriteRestaurant {
  String id;
  String name;
  String city;
  String pictureId;
  double rating;

  FavoriteRestaurant({
    required this.id,
    required this.name,
    required this.city,
    required this.pictureId,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': city,
      'pictureId': pictureId,
      'rating': rating,
    };
  }

  factory FavoriteRestaurant.fromJson(Map<String, dynamic> json) {
    return FavoriteRestaurant(
      id: json['id'],
      name: json['name'],
      city: json['address'],
      pictureId: json['pictureId'],
      rating: json['rating'],
    );
  }
}
