import 'package:dishdash_restaurant/ui/detail_screen.dart';
import 'package:dishdash_restaurant/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'common/theme.dart';
import 'common/util.dart';
import 'data/api/restaurant_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'DishDash Restaurant',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant)
      },
    );
  }
}
