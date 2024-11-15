import 'package:dishdash_restaurant/data/model/favorite_restaurant.dart';
import 'package:dishdash_restaurant/data/model/restaurant_detail.dart';
import 'package:dishdash_restaurant/provider/favorite/restaurant_database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  final RestaurantDetail restaurantDetail;

  const FavoriteIconWidget({super.key, required this.restaurantDetail});

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  void initState() {
    super.initState();

    final restaurantDatabaseProvider =
        context.read<RestaurantDatabaseProvider>();

    Future.microtask(() async {
      await restaurantDatabaseProvider
          .loadRestaurantById(widget.restaurantDetail.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantDatabaseProvider =
        context.watch<RestaurantDatabaseProvider>();

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          restaurantDatabaseProvider.toggleFavorite(FavoriteRestaurant(
            id: widget.restaurantDetail.id,
            pictureId: widget.restaurantDetail.pictureId,
            name: widget.restaurantDetail.name,
            city: widget.restaurantDetail.city,
            rating: widget.restaurantDetail.rating,
          ));
        },
        icon: Icon(
          restaurantDatabaseProvider.isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}
