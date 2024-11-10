import 'package:dishdash_restaurant/data/model/restaurant_detail.dart';
import 'package:dishdash_restaurant/provider/detail/favorite_icon_provider.dart';
import 'package:dishdash_restaurant/provider/detail/favorite_list_provider.dart';
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
    final favoriteListProvider = context.read<FavoriteListProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() {
      final restaurantInList =
          favoriteListProvider.checkItemFavorite(widget.restaurantDetail);
      favoriteIconProvider.isFavorite = restaurantInList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final favoriteListProvider = context.read<FavoriteListProvider>();
        final favoriteIconProvider = context.read<FavoriteIconProvider>();
        final isFavorite = favoriteIconProvider.isFavorite;

        if (isFavorite) {
          favoriteListProvider.removeFavorite(widget.restaurantDetail);
        } else {
          favoriteListProvider.addFavorite(widget.restaurantDetail);
        }
        context.read<FavoriteIconProvider>().isFavorite = !isFavorite;
      },
      icon: Icon(
        context.watch<FavoriteIconProvider>().isFavorite
            ? Icons.favorite
            : Icons.favorite_border,
      ),
    );
  }
}