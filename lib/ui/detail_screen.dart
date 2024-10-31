import 'package:dishdash_restaurant/data/restaurant.dart';
import 'package:dishdash_restaurant/ui/menu_list.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final RestaurantElement restaurant;

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
                  _buildSectionTitle('Menus'),
                  const Divider(height: 8.0),
                  _buildMenuSection('Foods', restaurant.menus.foods),
                  _buildMenuSection('Drinks', restaurant.menus.drinks),
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
      child: Image.network(restaurant.pictureId),
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

  Widget _buildMenuSection(String title, List<Drink> menuItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8.0),
        MenuList(menu: menuItems),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
