import 'package:dishdash_restaurant/provider/detail/favorite_list_provider.dart';
import 'package:dishdash_restaurant/provider/detail/restaurant_detail_provider.dart';
import 'package:dishdash_restaurant/provider/main/index_nav_provider.dart';
import 'package:dishdash_restaurant/provider/home/restaurant_provider.dart';
import 'package:dishdash_restaurant/screen/detail/detail_screen.dart';
import 'package:dishdash_restaurant/screen/detail/restaurant_detail_args.dart';
import 'package:dishdash_restaurant/screen/main_screen.dart';
import 'package:dishdash_restaurant/static/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/theme.dart';
import 'common/util.dart';
import 'data/api/api_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => ApiService(),
      ),
      ChangeNotifierProvider(
        create: (context) => IndexNavProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            RestaurantProvider(apiService: context.read<ApiService>()),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            RestaurantDetailProvider(apiService: context.read<ApiService>()),
      ),
      ChangeNotifierProvider(
        create: (context) => FavoriteListProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'DishDash Restaurant',
      theme: theme.light(),
      darkTheme: theme.dark(),
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as RestaurantDetailArguments;
          return RestaurantDetailScreen(
            restaurantId: args.restaurantId,
            pictureId: args.pictureId,
          );
        }
      },
    );
  }
}
