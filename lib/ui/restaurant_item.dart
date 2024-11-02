import 'package:flutter/material.dart';
import '../data/api/restaurant_result.dart';
import 'detail_screen.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  final _baseImage = 'https://restaurant-api.dicoding.dev/images/small/';

  const RestaurantItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RestaurantDetailScreen.routeName,
          arguments: restaurant,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 8.0,
            bottom: 8.0
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  "$_baseImage${restaurant.pictureId}",
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _restaurantInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _restaurantInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(restaurant.city),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.orange,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text('${restaurant.rating}'),
          ],
        ),
      ],
    );
  }
}
