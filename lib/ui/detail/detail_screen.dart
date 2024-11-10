import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/restaurant_detail.dart';
import '../../data/model/restaurant_result.dart';
import '../../provider/detail/restaurant_detail_provider.dart';
import '../../static/restaurant_detail_result_state.dart';
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
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<RestaurantDetailProvider>()
          .fetchRestaurantDetail(widget.restaurant.id ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            _buildAppBar(),
          ];
        },
        body: Consumer<RestaurantDetailProvider>(
          builder: (context, value, child) {
            return switch (value.restaurantDetailState) {
              RestaurantDetailLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
              RestaurantDetailLoadedState(data: var restaurantDetail) =>
                _buildDetailScreen(restaurantDetail),
              RestaurantDetailErrorState(error: var message) => Center(
                  child: _buildError(message, value),
                ),
              _ => const SizedBox()
            };
          },
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
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
            const SizedBox(height: 32.0),
            _buildSectionTitle('Submit Your Review'),
            const Divider(height: 8.0),
            _buildReviewForm(),
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

  Widget _buildReviewForm() {
    return Card(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[850]
          : Colors.white,
      shadowColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black.withOpacity(0.5)
          : Colors.grey.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _reviewController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Your Review',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Submit Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitReview() async {
    final String name = _nameController.text;
    final String review = _reviewController.text;

    if (name.isNotEmpty && review.isNotEmpty) {
      final provider =
          Provider.of<RestaurantDetailProvider>(context, listen: false);

      String message;

      try {
        await provider.submitReview(widget.restaurant.id ?? "", name, review);
        message = provider.message;
        provider.fetchRestaurantDetail(widget.restaurant.id ?? "");
      } catch (e) {
        message = provider.message;
      }

      _nameController.clear();
      _reviewController.clear();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill out both name and review fields.')),
      );
    }
  }

  @override
  dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }
}
