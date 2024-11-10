import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/detail/favorite_list_provider.dart';
import '../../static/navigation_route.dart';
import '../detail/restaurant_detail_args.dart';
import '../home/restaurant_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite List"),
        centerTitle: true,
      ),
      body: Consumer<FavoriteListProvider>(
        builder: (context, value, child) {
          final favoriteList = value.favoriteList;
          return switch (favoriteList.isNotEmpty) {
            true => ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final restaurantDetail = favoriteList[index];
                  return RestaurantItem(
                    pictureId: restaurantDetail.pictureId,
                    name: restaurantDetail.name,
                    city: restaurantDetail.city,
                    rating: restaurantDetail.rating,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        arguments: RestaurantDetailArguments(
                            restaurantId: restaurantDetail.id,
                            pictureId: restaurantDetail.pictureId
                        ),
                      );
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
