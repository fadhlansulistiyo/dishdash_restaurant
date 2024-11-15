import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/favorite/restaurant_database_provider.dart';
import '../../static/navigation_route.dart';
import '../detail/restaurant_detail_args.dart';
import '../home/restaurant_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<RestaurantDatabaseProvider>().loadAllRestaurant();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isFirstLoad) {
      context.read<RestaurantDatabaseProvider>().loadAllRestaurant();
    }
    _isFirstLoad = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite List"),
        centerTitle: true,
      ),
      body: Consumer<RestaurantDatabaseProvider>(
        builder: (context, value, child) {
          final favoriteList = value.restaurantList ?? [];
          return switch (favoriteList.isNotEmpty) {
            true => ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final restaurant = favoriteList[index];
                  final restaurantDatabaseProvider =
                      context.read<RestaurantDatabaseProvider>();
                  return RestaurantItem(
                    pictureId: restaurant.pictureId,
                    name: restaurant.name,
                    city: restaurant.city,
                    rating: restaurant.rating,
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        arguments: RestaurantDetailArguments(
                          restaurantId: restaurant.id,
                          pictureId: restaurant.pictureId,
                        ),
                      );
                      if (mounted) {
                        restaurantDatabaseProvider.loadAllRestaurant();
                      }
                    },
                  );
                },
              ),
            _ => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You don't have any favorites yet."),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
