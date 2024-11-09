import 'package:dishdash_restaurant/static/restaurant_result_state.dart';
import 'package:dishdash_restaurant/ui/home/restaurant_item.dart';
import 'package:dishdash_restaurant/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/home/restaurant_provider.dart';
import '../../provider/result_state.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: const Text('DishDash Restaurant'),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: _buildSearchField(),
        ),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('DishDash Restaurant'),
        trailing: _buildSearchField(),
      ),
      child: _buildList(),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search restaurants...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (query) {
          final provider =
              Provider.of<RestaurantProvider>(context, listen: false);
          provider.searchRestaurants(query);
        },
      ),
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, value, _) {
        return switch (value.restaurantResultState) {
          RestaurantListLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
          RestaurantListLoadedState(data: var restaurantList) =>
            ListView.builder(
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];
                return RestaurantItem(restaurant: restaurant);
              },
            ),
          RestaurantListErrorState(error: var message) => Center(
              child: Text(message),
            ),
          _ => const SizedBox()
        };
      },
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _retryFetchingData,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _retryFetchingData() {
    final provider = Provider.of<RestaurantProvider>(context, listen: false);
    provider.fetchAllRestaurants();
  }

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
