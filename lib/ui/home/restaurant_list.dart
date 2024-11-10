import 'package:dishdash_restaurant/static/restaurant_result_state.dart';
import 'package:dishdash_restaurant/ui/home/restaurant_item.dart';
import 'package:dishdash_restaurant/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/home/restaurant_provider.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? _buildSearchField()
            : const Text('DishDash Restaurant'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _performSearch('');
                }
              });
            },
          ),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: _isSearching
            ? _buildSearchField()
            : const Text('DishDash Restaurant'),
        trailing: GestureDetector(
          child:
              Icon(_isSearching ? CupertinoIcons.clear : CupertinoIcons.search),
          onTap: () {
            setState(() {
              _isSearching = !_isSearching;
              if (!_isSearching) {
                _searchController.clear();
                _performSearch('');
              }
            });
          },
        ),
      ),
      child: _buildList(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search restaurants...',
        border: InputBorder.none,
      ),
      onChanged: _performSearch,
      onSubmitted: _performSearch,
    );
  }

  void _performSearch(String query) {
    final provider = Provider.of<RestaurantProvider>(context, listen: false);
    provider.searchRestaurants(query);
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
              child: _buildError(message),
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
