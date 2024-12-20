import 'package:dishdash_restaurant/screen/home/restaurant_list.dart';
import 'package:dishdash_restaurant/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return const Scaffold(
      body: RestaurantList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return const CupertinoPageScaffold(
      child: RestaurantList(),
    );
  }
}
