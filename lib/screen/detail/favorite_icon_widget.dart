import 'package:dishdash_restaurant/data/model/favorite_restaurant.dart';
import 'package:dishdash_restaurant/data/model/restaurant_detail.dart';
import 'package:dishdash_restaurant/provider/detail/favorite_icon_provider.dart';
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
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() async {
      await restaurantDatabaseProvider
          .loadRestaurantById(widget.restaurantDetail.id);
      final value = restaurantDatabaseProvider.restaurant == null
          ? false
          : restaurantDatabaseProvider.restaurant!.id ==
              widget.restaurantDetail.id;
      favoriteIconProvider.isFavorite = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        onPressed: () async {
          final restaurantDatabaseProvider =
              context.read<RestaurantDatabaseProvider>();
          final favoriteIconProvider = context.read<FavoriteIconProvider>();
          final isFavorite = favoriteIconProvider.isFavorite;

          if (isFavorite) {
            await restaurantDatabaseProvider
                .removeRestaurantById(widget.restaurantDetail.id);
          } else {
            await restaurantDatabaseProvider.saveRestaurant(FavoriteRestaurant(
                id: widget.restaurantDetail.id,
                pictureId: widget.restaurantDetail.pictureId,
                name: widget.restaurantDetail.name,
                city: widget.restaurantDetail.city,
                rating: widget.restaurantDetail.rating));
          }
          favoriteIconProvider.isFavorite = !isFavorite;
          restaurantDatabaseProvider.loadAllRestaurant();
        },
        icon: Icon(
          context.watch<FavoriteIconProvider>().isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}
