import 'package:dishdash_restaurant/provider/detail/restaurant_detail_provider.dart';
import 'package:dishdash_restaurant/provider/favorite/restaurant_database_provider.dart';
import 'package:dishdash_restaurant/provider/main/index_nav_provider.dart';
import 'package:dishdash_restaurant/provider/home/restaurant_provider.dart';
import 'package:dishdash_restaurant/provider/settings/local_notification_provider.dart';
import 'package:dishdash_restaurant/provider/settings/theme_provider.dart';
import 'package:dishdash_restaurant/screen/detail/detail_screen.dart';
import 'package:dishdash_restaurant/screen/detail/restaurant_detail_args.dart';
import 'package:dishdash_restaurant/screen/main_screen.dart';
import 'package:dishdash_restaurant/services/http_service.dart';
import 'package:dishdash_restaurant/services/local_notification_service.dart';
import 'package:dishdash_restaurant/services/notification_preference.dart';
import 'package:dishdash_restaurant/services/theme_preferences.dart';
import 'package:dishdash_restaurant/static/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/theme.dart';
import 'common/util.dart';
import 'data/api/api_service.dart';
import 'data/local/restaurant_database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

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
      Provider(
        create: (context) => RestaurantDatabaseService(),
      ),
      ChangeNotifierProvider(
        create: (context) => RestaurantDatabaseProvider(
          context.read<RestaurantDatabaseService>(),
        ),
      ),
      Provider(
        create: (context) => ThemePreference(prefs),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(context.read<ThemePreference>()),
      ),
      Provider(
        create: (context) => HttpService(),
      ),
      Provider(
        create: (context) => LocalNotificationService(
          context.read<HttpService>(),
        )
          ..init()
          ..configureLocalTimeZone(),
      ),
      Provider(
        create: (context) => NotificationPreference(prefs),
      ),
      ChangeNotifierProvider(
        create: (context) => LocalNotificationProvider(
            context.read<LocalNotificationService>(),
            context.read<NotificationPreference>())
          ..requestPermissions(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");
    final themeProvider = context.watch<ThemeProvider>();

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'DishDash Restaurant',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: themeProvider.themeMode,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as RestaurantDetailArguments;
          return RestaurantDetailScreen(
            restaurantId: args.restaurantId,
            pictureId: args.pictureId,
          );
        }
      },
    );
  }
}
