import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../data/api/restaurant_detail.dart';
import '../data/api/restaurant_result.dart';
import '../provider/restaurant_detail_provider.dart';
import '../provider/result_state.dart';
import 'menu_list.dart';

class RestaurantDetailScreen extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  final _baseImage = 'https://restaurant-api.dicoding.dev/images/medium/';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<RestaurantDetailProvider>(context, listen: false);
      provider.fetchRestaurantDetail(widget.restaurant.id ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250.0,
              pinned: true,
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.restaurant.pictureId ?? "",
                  child: Image.network(
                    "$_baseImage${widget.restaurant.pictureId}",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.grey,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        body: Consumer<RestaurantDetailProvider>(
          builder: (context, provider, _) {
            if (provider.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (provider.state == ResultState.error) {
              return _buildError(provider.message, provider);
            } else if (provider.state == ResultState.hasData) {
              final restaurantDetail = provider.restaurantDetail;
              return _buildDetailScreen(restaurantDetail);
            } else {
              return const Center(child: Text('No details available'));
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView _buildDetailScreen(RestaurantDetail restaurantDetail) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(restaurantDetail.name),
            const SizedBox(height: 8.0),
            _buildLocationRow(restaurantDetail.city, restaurantDetail.address),
            const SizedBox(height: 4),
            _buildRatingRow(restaurantDetail.rating),
            const Divider(height: 32.0),
            _buildSectionTitle('Description'),
            const SizedBox(height: 8.0),
            _buildDescription(restaurantDetail.description),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Menus'),
            const Divider(height: 8.0),
            _buildMenuSection('Foods', restaurantDetail.menus.foods),
            _buildMenuSection('Drinks', restaurantDetail.menus.drinks),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Reviews'),
            const Divider(height: 8.0),
            _buildReviewList(restaurantDetail),
          ],
        ),
      ),
    );
  }

  Widget _buildError(String message, RestaurantDetailProvider provider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                provider.fetchRestaurantDetail(widget.restaurant.id ?? ""),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _buildLocationRow(String city, String address) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          "$address, $city",
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildRatingRow(double rating) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.orange,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          '$rating',
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

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(fontSize: 14.0),
    );
  }

  Widget _buildMenuSection(String title, List<Category> menuItems) {
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

  Widget _buildReviewList(RestaurantDetail restaurant) {
    return Column(
      children: restaurant.customerReviews.map((review) {
        return Card(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[850]
              : Colors.white,
          shadowColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withOpacity(0.5)
              : Colors.grey.withOpacity(0.5),
          elevation:
              Theme.of(context).brightness == Brightness.dark ? 6.0 : 3.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text(
              review.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.review,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
                const SizedBox(height: 4.0),
                Text(
                  review.date,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
