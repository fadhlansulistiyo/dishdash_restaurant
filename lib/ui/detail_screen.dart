import 'package:flutter/material.dart';

import '../data/api/restaurant_result.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;
  final _baseImage = 'https://restaurant-api.dicoding.dev/images/large/';

  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 8.0),
                  _buildLocationRow(),
                  const SizedBox(height: 4),
                  _buildRatingRow(),
                  const Divider(height: 32.0),
                  _buildSectionTitle('Description'),
                  const SizedBox(height: 8.0),
                  _buildDescription(),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImage() {
    return Hero(
      tag: restaurant.pictureId,
      child: Image.network(
        "$_baseImage${restaurant.pictureId}",
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 100,
            color: Colors.grey,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      restaurant.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _buildLocationRow() {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          restaurant.city,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.orange,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          '${restaurant.rating}',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      restaurant.description,
      style: const TextStyle(fontSize: 14.0),
    );
  }
}
