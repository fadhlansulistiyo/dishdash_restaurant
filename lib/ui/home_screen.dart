import 'package:dishdash_restaurant/provider/restaurant_provider.dart';
import 'package:dishdash_restaurant/ui/restaurant_list.dart';
import 'package:dishdash_restaurant/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api/api_service.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  final Widget _restaurantList = ChangeNotifierProvider<RestaurantProvider>(
    create: (_) => RestaurantProvider(apiService: ApiService()),
    child: const RestaurantList(),
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _restaurantList,
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _restaurantList,
    );
  }
}
